---
title: Regexp
date: 2014-04-18 10:30
authors: JacBac
categories: regexp
banner: /posts_uploads/2013/11/acm.jpg

layout: posts

---

## Phone

### Is french mobile phone number

Description:    French Post Code Validation
Regular Expression: ^0[1-6]{1}(([0-9]{2}){4})|((\s[0-9]{2}){4})|((-[0-9]{2}){4})$
Pass:   01 46 70 89 12|||01-46-70-89-12|||0146708912
Fail:   01-46708912|||01 46708912|||+33235256677


## Tech

### Is IP v4 address

Description:    Validates IP addresses in the dotted quad form
Regular Expression: ^(([3-9]\d?|[01]\d{0,2}|2\d?|2[0-4]\d|25[0-5])\.){3}([3-9]\d?|[01]\d{0,2}|2\d?|2[0-4]\d|25[0-5])$
Pass:   192.168.1.1|||10.2.234.1|||66.129.71.122
Fail:   192.168.1|||10.2.1234.1|||66 129 71 122

### Is IP v6 address

Description:    Validates all IPv6 text representations as defined within RFC 2373
Regular Expression: ^(^(([0-9A-F]{1,4}(((:[0-9A-F]{1,4}){5}::[0-9A-F]{1,4})|((:[0-9A-F]{1,4}){4}::[0-9A-F]{1,4}(:[0-9A-F]{1,4}){0,1})|((:[0-9A-F]{1,4}){3}::[0-9A-F]{1,4}(:[0-9A-F]{1,4}){0,2})|((:[0-9A-F]{1,4}){2}::[0-9A-F]{1,4}(:[0-9A-F]{1,4}){0,3})|(:[0-9A-F]{1,4}::[0-9A-F]{1,4}(:[0-9A-F]{1,4}){0,4})|(::[0-9A-F]{1,4}(:[0-9A-F]{1,4}){0,5})|(:[0-9A-F]{1,4}){7}))$|^(::[0-9A-F]{1,4}(:[0-9A-F]{1,4}){0,6})$)|^::$)|^((([0-9A-F]{1,4}(((:[0-9A-F]{1,4}){3}::([0-9A-F]{1,4}){1})|((:[0-9A-F]{1,4}){2}::[0-9A-F]{1,4}(:[0-9A-F]{1,4}){0,1})|((:[0-9A-F]{1,4}){1}::[0-9A-F]{1,4}(:[0-9A-F]{1,4}){0,2})|(::[0-9A-F]{1,4}(:[0-9A-F]{1,4}){0,3})|((:[0-9A-F]{1,4}){0,5})))|([:]{2}[0-9A-F]{1,4}(:[0-9A-F]{1,4}){0,4})):|::)((25[0-5]|2[0-4][0-9]|[0-1]?[0-9]{0,2})\.){3}(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]{0,2})$$
Pass:   ::0:0:0:FFFF:129.144.52.38|||FEDC:BA98::3210:FEDC:BA98:7654:3210|||::13.1.68.3
Fail:   FEDC:BA98:7654:3210:FEDC:BA98:7654:3210:1234|||3210:FEDC:BA98:7654:3210:1234|||:FEDC:BA98:7654:3210:

## Other

### Is ISBN 10

Description:    Validation of 10 digit ISBN. The ISBN number must be preceded by the text "ISBN:" or "ISBN-10:" , the colon is optional.
Regular Expression: ISBN(?:-10)?:?\x20(?=.{13}$)\d{1,5}([- ])\d{1,7}\1\d{1,6}\1(\d|X)$
Pass:   ISBN-10: 0-93028-923-4
Fail:   ISBN-13: 978-0-5960-0289-3

### Is ISBN 13

Description:    Validation of new 13 digit ISBN. The ISBN number must be preceded by the text "ISBN:" or "ISBN-13:" , the colon is optional.
Regular Expression: ISBN(?:-13)?:?\x20*(?=.{17}$)97(?:8|9)([ -])\d{1,5}\1\d{1,7}\1\d{1,6}\1\d$
Pass:   ISBN-13: 978-0-5960-0289-3
Fail:   ISBN-10: 0596002890
