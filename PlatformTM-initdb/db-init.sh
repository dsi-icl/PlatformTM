#!/bin/bash

if [ -f /tmp/.db-init-done ]; then
  echo "Database already initialized. Recreate this container to force init to run."
  exit 0;
fi

echo "current dir $(pwd) Initializing Database "

echo "$(ls -l)"

cd PlatformTM.Data && \
dotnet restore && \
rm Migrations/* && \
dotnet ef --startup-project ../PlatformTM.API/ migrations add Initial -c PlatformTMdbContext && \
dotnet ef --startup-project ../PlatformTM.API/ database update -c PlatformTMdbContext --verbose && \

#mysql=( mysql -uroot -pimperial -hmariadb -Dptmdb )

#for f in /docker-entrypoint-initdb.d/*; do
#	case "$f" in
#		*.sh)     echo "$0: running $f"; . "$f" ;;
#		*.sql)    echo "$0: running $f"; "${mysql[@]}" < "$f"; echo ;;
#		*.sql.gz) echo "$0: running $f"; gunzip -c "$f" | "${mysql[@]}"; echo ;;
#		*)        echo "$0: ignoring $f" ;;
#	esac
#	echo
#done

touch /tmp/.db-init-done
