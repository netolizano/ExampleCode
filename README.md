# Example code
This is an example code using Telerik WebForms Ajax Controls version 2018.3.910 (DEV)
--Taking advantage of the Ajax Controls that provide the suit to make the code simple

## Executing the project
Please create a folder called 'Test' in your C Disk and paste the folder inside
The path of the solution should be 'C:\Test\ExampleCode', this is necessary because there is a Database file inside the project to simulate the SQL Server.


## About the solution
The solution is  multilayer, each layer is represented in one **Class Library C# project** 

> DatabaseSimulation project
This project is to simulate one SQL Server, all the access to the database is using Stored Procedures

> DataLayer project
The project contains the Entity Framework Model, the approach was Database first.
Inside the model you will find the import of the table and Stored Procedures

>BusinessLayer
This is where all the Business Logic should be written.
It also contains access to the functions that the Entity Project generates when a Store Procedure is imported.

>Entities
This project can contain DTO or POCO Classes.

>UI
This is a Web Project that contains the User Interface.
Here you will find 2 webForms:
1. Full ajax using Telerik WebForms Ajax Controls. 
2. A basic search form, that call a WebAPI service using Ajax


The mapping between "Entities Classes" and "Model Classes" are made using a tool called [AutoMaper](http://automapper.org/)

[Download in zip](https://drive.google.com/file/d/1uR3RcZW_AArGArsvlIZ3Ek5G0jdzN2MU/view?usp=sharing)

[Gif Example](https://drive.google.com/file/d/1oAQdslj4HJpIN11Dct1WxbWuE-mFxZ2X/view?usp=sharing)





