using ChequesProyecto.Repositories.Account;
using ChequesProyecto.Repositories.Cheque;
using ChequesProyecto.Repositories.City;
using ChequesProyecto.Repositories.ReportType;
using ChequesProyecto.Services.Account;
using ChequesProyecto.Services.Cheque;
using ChequesProyecto.Services.City;
using ChequesProyecto.Services.ReportType;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

//REPOSITORIOS
builder.Services.AddScoped<IAccountRepository, AccountRepository>();
builder.Services.AddScoped<ICityRepository, CityRepository>();
builder.Services.AddScoped<IChequeRepository, ChequeRepository>();
builder.Services.AddScoped<IReportTypeRepository, ReportTypeRepository>();
builder.Services.AddScoped<IReportTypeRepository, ReportTypeRepository>();



//SERVICIOS
builder.Services.AddScoped<IAccountService, AccountService>();
builder.Services.AddScoped<ICityService, CityService>();
builder.Services.AddScoped<IChequeService, ChequeService>();
builder.Services.AddScoped<IReportTypeService, ReportTypeService>();




builder.Services.AddCors(option => {
    option.AddPolicy("alexcors", police => {
        police.WithOrigins("http://localhost:4200");
        police.AllowAnyHeader();
        police.AllowAnyMethod();
    });
});

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();



// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthorization();

app.MapControllers();

app.UseCors("alexcors");

app.Run();
