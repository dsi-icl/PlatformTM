FROM microsoft/aspnetcore-build:1.1

RUN apt-get update && \
    apt-get install -y --no-install-recommends mysql-client && \
    apt-get purge -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /data
#COPY PlatformTM-server/PlatformTM.sln ./
#COPY PlatformTM-server/PlatformTM.API/PlatformTM.API.csproj PlatformTM.API/
#COPY PlatformTM-server/PlatformTM.Core/PlatformTM.Core.csproj PlatformTM.Core/
#COPY PlatformTM-server/PlatformTM.Services/PlatformTM.Services.csproj PlatformTM.Services/
#COPY PlatformTM-server/PlatformTM.Data/PlatformTM.Data.csproj PlatformTM.Data/
#RUN echo " $(ls -l)"
COPY ./PlatformTM-server .
COPY ./PlatformTM-initdb .
#RUN echo "current dir $(pwd) Initializing Database "
#RUN echo " $(ls -l)"
#WORKDIR /data/PlatformTM-server
#RUN dotnet restore -nowarn:msb3202,nu1503
#WORKDIR /data/PlatformTM-server/PlatformTM.Data

#RUN echo "current dir $(pwd) Initializing Database "
#RUN echo " $(ls -l)"

#RUN rm Migrations/*
#RUN dotnet ef --startup-project ../PlatformTM.API/ migrations add Initial -c PlatformTMdbContext
#RUN dotnet ef --startup-project ../PlatformTM.API/ database update -c PlatformTMdbContext --verbose

#RUN for f in /docker-entrypoint-initdb.d/*; do
#	case "$f" in
#		*.sh)     echo "$0: running $f"; . "$f" ;;
#		*.sql)    echo "$0: running $f"; "${mysql[@]}" < "$f"; echo ;;
#		*.sql.gz) echo "$0: running $f"; gunzip -c "$f" | "${mysql[@]}"; echo ;;
#		*)        echo "$0: ignoring $f" ;;
#	esac
#	echo
#done

#WORKDIR /src
#COPY PlatformTM.sln ./
#COPY PlatformTM.API/PlatformTM.API.csproj PlatformTM.API/
#COPY PlatformTM.Core/PlatformTM.Core.csproj PlatformTM.Core/
#COPY PlatformTM.Services/PlatformTM.Services.csproj PlatformTM.Services/
#COPY PlatformTM.Data/PlatformTM.Data.csproj PlatformTM.Data/
#RUN dotnet restore -nowarn:msb3202,nu1503
#COPY . .
#WORKDIR /src/PlatformTM.API
#RUN dotnet build -c Release -o /app
ENTRYPOINT ["./db-init.sh"]