#!/bin/env ruby
# encoding: utf-8

# override default format for dates
require 'date'

newv = [
{'Janvier' => 1, 'Février' => 2, 'Mars' => 3, 'Avril' => 4, 'Mai' => 5, 'Juin' => 6, 'Juillet' => 7, 'Août' => 8, 'Septembre'=> 9, 'Octobre' =>10, 'Novembre' =>11, 'Décembre' => 12},
{'Dimanche' => 0, 'Lundi' => 1, 'Mardi' => 2, 'Mercredi' => 3, 'Jeudi'=> 4, 'Vendredi' => 5, 'Samedi' => 6},
{'jan' => 1, 'fév' => 2, 'mar' => 3, 'avr' => 4, 'mai' => 5, 'juin' => 6, 'juil' => 7, 'aoû' => 8, 'sep' => 9, 'oct' =>10, 'nov' =>11, 'déc' => 12},
{'dim' => 0, 'lun' => 1, 'mar' => 2, 'mer' => 3, 'jeu' => 4, 'ven' => 5, 'sam' => 6},
[nil] + %w(Janvier Février Mars Avril Mai Juin Juillet Août Septembre Octobre Novembre Décembre),
%w(Dimanche Lundi Mardi Mercredi Jeudi Vendredi Samedi),
[nil] + %w(jan fév mar avr mai juin juil aoû sep oct nov déc),
%w(dim lun mar mer jeu ven sam)
]
Date::FRENCH_MONTHS=newv[0]
Date::FRENCH_DAYS=newv[1]
Date::FRENCH_ABBR_MONTHS=newv[2]
Date::FRENCH_ABBR_DAYS=newv[3]
Date::FRENCH_MONTHNAMES=newv[4]
Date::FRENCH_DAYNAMES=newv[5]
Date::FRENCH_ABBR_MONTHNAMES=newv[6]
Date::FRENCH_ABBR_DAYNAMES=newv[7]
 
class Time
  def strftime_french(format)
    format = format.dup
    format.gsub!(/%a/, Date::FRENCH_ABBR_DAYNAMES[self.wday])
    format.gsub!(/%A/, Date::FRENCH_DAYNAMES[self.wday])
    format.gsub!(/%b/, Date::FRENCH_ABBR_MONTHNAMES[self.mon])
    format.gsub!(/%B/, Date::FRENCH_MONTHNAMES[self.mon])
    self.strftime(format)
  end
end
 
class Date
  def strftime_french(format)
    format = format.dup
    format.gsub!(/%a/, Date::FRENCH_ABBR_DAYNAMES[self.wday])
    format.gsub!(/%A/, Date::FRENCH_DAYNAMES[self.wday])
    format.gsub!(/%b/, Date::FRENCH_ABBR_MONTHNAMES[self.mon])
    format.gsub!(/%B/, Date::FRENCH_MONTHNAMES[self.mon])
    self.strftime(format)
  end
end
