#!/bin/bash
    set -e
    
    echo -e "\033[42m -- dvdrental db restore -- \033[m"
    pg_restore -U postgres -d dvdrental /dvdrental.tar

    echo "Create-Function SQL"
    psql -U postgres -d dvdrental -a -f /CREATE-FUNCTION.sql
    echo '/=\'
    echo '=-='
    echo '\=/'
    echo "Create-Role SQL"
    psql -U postgres -d dvdrental -a -f /CREATE-ROLE.sql
    echo '/=\'
    echo '=-='
    echo '\=/'
    echo "Authentication SQL"
    psql -U postgres -d dvdrental -a -f /Authentication.sql
    echo '/=\'
    echo '=-='
    echo '\=/'