# Week 1 Homework

### Question 1. Knowing docker tags

Run the command to get information on Docker

docker --help

Now run the command to get help on the "docker build" command

Which tag has the following text? - Write the image ID to the file

* `--imageid string`
* `--iidfile string`
* `--idimage string`
* `--idfile string`

Ans: Running the command `docker build help`, we see that
```
...
--iidfile string          Write the image ID to the file
```

### Question 2. Understanding docker first run

Run docker with the python:3.9 image in an interactive mode and the entrypoint of bash. Now check the python modules that are installed (use pip list). How many python packages/modules are installed?

* 1
* 6
* 3
* 7

Ans: To run the python:3.9 image in interactive mode with the entrypoint of bash, you can use the following command:

```sh
docker run -it --entrypoint bash python:3.9
```

Once you're inside the container, you can use the pip list command to check the installed python packages/modules. The number of packages/modules will be listed at the bottom of the output.

```
Unable to find image 'python:3.9' locally
3.9: Pulling from library/python
bbeef03cda1f: Pull complete 
f049f75f014e: Pull complete 
56261d0e6b05: Pull complete 
9bd150679dbd: Pull complete 
5b282ee9da04: Pull complete 
03f027d5e312: Pull complete 
3c8304b923fa: Pull complete 
1f510f0937ac: Pull complete 
cb0f5bf32016: Pull complete 
Digest: sha256:4b7ee97f021e0d1f5749ea3ad6d1bae1ca15a9b42cdebcf40269502d54f56666
Status: Downloaded newer image for python:3.9
root@28521a416664:/# pip list
Package    Version
---------- -------
pip        22.0.4
setuptools 58.1.0
wheel      0.38.4
WARNING: You are using pip version 22.0.4; however, version 22.3.1 is available.
You should consider upgrading via the '/usr/local/bin/python -m pip install --upgrade pip' command.
```

We have 3 packages installed (pip, setuptools, wheel).

## Preparing Postgres

Run Postgres and load data as shown in the videos We'll use the green taxi trips from January 2019:
```
wget https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-01.csv.gz
```
You will also need the dataset with zones:
```
wget https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv
```
Download this data and put it into Postgres (with jupyter notebooks or with a pipeline)

### Question 3. Count records

How many taxi trips were totally made on January 15?

Tip: started and finished on 2019-01-15.

Remember that lpep_pickup_datetime and lpep_dropoff_datetime columns are in the format timestamp (date and hour+min+sec) and not in date.

* 20689
* 20530
* 17630
* 21090

```sql
SELECT COUNT(*) as COUNT_jan_15_2019 FROM green_tripdata
WHERE date_trunc('day', lpep_pickup_datetime) = '2019-01-15'
AND date_trunc('day', lpep_dropoff_datetime) = '2019-01-15';
```

Executing the query, we have 20530 trips made on January 15.

### Largest trip for each day
Which was the day with the largest trip distance Use the pick up time for your calculations.

* 2019-01-18
* 2019-01-28
* 2019-01-15
* 2019-01-10

### Question 5. The number of passengers

In 2019-01-01 how many trips had 2 and 3 passengers?

* 2: 1282 ; 3: 266
* 2: 1532 ; 3: 126
* 2: 1282 ; 3: 254
* 2: 1282 ; 3: 274

```sql
SELECT passenger_count, COUNT(*) as trip_count
FROM trips
WHERE date_trunc('day', tpep_pickup_datetime) = '2019-01-01'
  AND passenger_count IN (2, 3)
GROUP BY passenger_count
```

Ans: 
* 2: 1282 ; 3: 254

### Question 6. Largest tip

For the passengers picked up in the Astoria Zone which was the drop off zone that had the largest tip? We want the name of the zone, not the id.

Note: it's not a typo, it's tip , not trip

* Central Park
* Jamaica
* South Ozone Park
* Long Island City/Queens Plaza
