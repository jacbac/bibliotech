# A sitemap plugin that adds author pages to the sitemap
# based on the authors of blog articles.
module BlogAuthors
  class Options
    KEYS = [
            :authorlink,
            :author_template,
           ]

    KEYS.each do |name|
      attr_accessor name
    end

    def initialize(options={})
      options.each do |k,v|
        self.send(:"#{k}=", v)
      end
    end
  end

  class << self
    def registered(app, options_hash={}, &block)
      app.helpers Helpers

      options = Options.new(options_hash)
      yield options if block_given?

      options.authorlink ||= "authors/:author.html"

      # If "prefix" option is specified, all other paths are relative to it.
      # if options.prefix
      #   options.prefix = "/#{options.prefix}" unless options.prefix.start_with? '/'
      #   options.authorlink = File.join(options.prefix, options.authorlink)
      # end

      app.after_configuration do
        author_pages(options)

        if options.author_template
          ignore options.author_template

          sitemap.register_resource_list_manipulator(
                                                     :blog_authors,
                                                     AuthorPages.new(self),
                                                     false
                                                     )
        end
      end
    end

    alias :included :registered
  end

  module Helpers
    def author_pages(options=nil)
      @_author_pages ||= options
    end

    def author_path(author)
      sitemap.find_resource_by_path(AuthorPages.link(self, author)).try(:url)
    end
  end

  class AuthorPages
    def initialize(app)
      @app = app
    end

    def manipulate_resource_list(resources)
      resources + @app.blog.authors.map do |author, articles|
        path = AuthorPages.link(@app, author)

        p = ::Middleman::Sitemap::Resource.new(
          @app.sitemap,
          path,
          # @app.author_pages.author_template
        )
        p.proxy_to(@app.author_pages.author_template)

        # Add metadata in local variables so it's accessible to
        # later extensions
        p.add_metadata :locals => {
          'page_type' => 'author',
          'authorname' => author,
          'articles' => articles
        }
        # Add metadata in instance variables for backwards compatibility
        p.add_metadata do
          @author = author
          @articles = articles
        end
        p
      end
    end

    def self.link(app, author)
      ::Middleman::Util.normalize_path(
        app.author_pages.authorlink.sub(':author', author.parameterize))
    end

  end
end

module Middleman
  module Blog
    module BlogArticle
      # A list of authors for this article, set from frontmatter.
      # @return [Array<String>] (never nil)
      def authors
        article_authors = data["authors"]

        if article_authors.is_a? String
          article_authors.split(',').map(&:strip)
        else
          article_authors || []
        end
      end
    end
  end
end

module Middleman
  module Blog
    class BlogData
      # Returns a map from author name to an array
      # of BlogArticles associated with that author.
      # @return [Hash<String, Array<Middleman::Sitemap::Resource>>]
      def authors
        authors = {}
        @_articles.each do |article|
          article.authors.each do |author|
            authors[author] ||= []
            authors[author] << article
          end
        end

        authors.each do |author, articles|
          authors[author] = articles.sort_by(&:date).reverse
        end

        authors
      end
    end
  end
end


::Middleman::Extensions.register(:blog_authors, BlogAuthors)
