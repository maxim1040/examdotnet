# examdotnet
This is the exam project of Sabak Maxim, Jawad Bousmara and Anas El Boujjoufi
To get acces to the database, we uploaded a SQL Query file, DataBank.sql, 
it will automatically add the necessary tables and data for the project to work.

The migrations folder is intentionally deleted because we had a lot of problem with it
So when u open the project in Visual Studio u need to migrate first :
  1.Open the project in Visual Studio
  2.Go to Tools > Command Line > Developper Command Line
  3.Enter the following command one by one in order :
      - cd exam
      - dotnet ef migrations add InitialCreate
      - dotnet ef 
