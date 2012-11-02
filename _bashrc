# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
export LANG=ja_JP.UTF-8
export SVN_EDITOR=vim

# User specific aliases and functions
alias g='sh /path/to/batch/command/g.sh'
alias gp='sh /path/to/batch/command/gp.sh'
alias gscala='sh /path/to/batch/command/gscala.sh'
alias php-check='sh /path/to/batch/command/php-check.sh'

PEAR_HOME=/path/to/tests/Projects/lib/php/pear
export PATH=$PEAR_HOME:$PATH

PHP_CLASSPATH=${PEAR_HOME}/php
export PHP_CLASSPATH=$PHP_CLASSPATH

alias vi='vim'
alias php-unit='phpunit --colors AllTests.php'
alias cst='svn st /path/to/Rev/ | grep "^[AMR]\s*/path/to/Rev/.*\.php" | sed "s/^[AMR] \+\/data\//\/data\//" | xargs php /path/to/External/PEAR/PHP_CodeSniffer/scripts/phpcs --standard=Prcm -n'
alias tomcat='/path/to/ci/tomcat/bin/catalina.sh'
alias aruby='/path/to/analytics/script/ruby/_call'

source ~/.nvm/nvm.sh
alias shasum='/usr/bin/sha1sum'

