FROM mcr.microsoft.com/dotnet/core/aspnet:3.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /src
COPY ["WebsiteStatus/WebsiteStatus.csproj", "WebsiteStatus/"]

RUN dotnet restore "WebsiteStatus/WebsiteStatus.csproj"
COPY . .
WORKDIR "/src/WebsiteStatus"
RUN dotnet build "WebsiteStatus.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WebsiteStatus.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebsiteStatus.dll"]