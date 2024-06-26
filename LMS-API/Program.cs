using LMS.Api.DataAccess;
using LMS.Api.Repository;
using WebApplication1.Repository;
using Microsoft.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.Extensions.DependencyInjection;



var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddTransient<ISqlDataAccess, SqlDataAccess>();
builder.Services.AddTransient<IMemberrepo, MemberRepo>();
builder.Services.AddTransient<IBookrepo, BookRepo>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
    app.UseCors(options =>
    {
        options.AllowAnyOrigin()
               .AllowAnyHeader()
               .AllowAnyMethod();
    });

}



app.UseAuthorization();

app.MapControllers();

app.Run();
