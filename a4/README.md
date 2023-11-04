Issue: unnecessary whitespace after genre of movie/show
- sed 's/\("[^"]*[^[:space:]]\)\s\+"/\1"/g'
 - s is for substitution
 - ("[^"]*[^[:space:]]\) is to match content excluding trailing spaces
 - \s\+ is to match 0+ whitespace preceding closing quote
 - \1 is the content from the capture group to replace pattern
 - g is for global

Issue: unnecessary empty lines
- awk 'NF'
 - NF is for number of fields, does not print line if NF = 0
