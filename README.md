# WorkerService
Worker Services in .NET Core 3.0

### Deploy Worker service as Window service.
1. Install Microsoft.Extensions.Hosting.WindowsServices package
2. Install Microsoft.Extensions.Hosting.WindowsServices Package
3. Call UseWindowsService() method when creating host.
```
return Host.CreateDefaultBuilder(args)
                .UseWindowsService()
                .ConfigureServices((hostContext, services) =>
                {
                    services.AddHostedService<Worker>();
                })
                .UseSerilog();
```
4. Publish worker process to local folder
5. Use Powershell to create window service
```
sc.exe create ".NET Joke Service" binpath=C:\Path\To\App.WindowsService.exe
```

#### Reference:
https://www.youtube.com/watch?v=PzrTiz_NRKA&ab_channel=IAmTimCorey
https://docs.microsoft.com/en-us/dotnet/core/extensions/windows-service
https://docs.microsoft.com/en-us/dotnet/core/extensions/workers
