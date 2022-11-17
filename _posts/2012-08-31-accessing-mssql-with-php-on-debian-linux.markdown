---
layout: post
title: "Accessing MSSQL With PHP on Debian Linux"
date: 2012-08-31 11:54
tags: 
---
We use MSSQL in work. And we use IIS as an internal web server. I want to develop
some small applications in a throwaway scratch space before I upload them to the
IIS server, so I use a virtual machine running Debian Linux and Apache.

I ran into some problems using PDO to connect to the SQL server. I was using the
ODBC driver and had it all set up properly. I could connect with `isql` and `osql`, 
I was able to run queries and get back information. Happy days, I thought. I tried
it through a PHP script and running a simple query was no problem. I was able to 
`SELECT * FROM table_name WHERE id=1`. 

Then I tried a stored procedure. 

{% highlight php %}
$connection = new \PDO('odbc:Database', 'username', 'password');
$sql = "SELECT * FROM tableName WHERE id = ?";
$statement = $connection->prepare($sql);
$statement->execute(array($id));
$row = $statement->fetch(PDO::FETCH_ASSOC);
{% endhighlight %}

This wasn't so successful. I ended up getting a Segmentation Fault. I did some
basic troubleshhoting using `die('okay');` after each line and narrowed it down
to the `fetch`statement. So off to the Googles I went.

It seems there is a longstanding bug with using ODBC to connect to MSSQL using PHP
on Linux. The solution was pretty simple, use `dblib` instead.

The new connection string then became

{% highlight php %}
$connection = new \PDO('dblib:dbname=database;host=sqlServer', 'username', 'password');
{% endhighlight %}

Make sure to have the `php5-sybase` package installed as that is the one that 
provides the dblib connection. Once that was installed, I was able to connect and
query the database to my heart's content.
