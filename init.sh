#!/bin/bash
    set -e
    set -x

    echo "******dvdrentals PostgreSQL initialisation******"
    pg_restore -U postgres -d dvdrental ./dvdrental.tar
