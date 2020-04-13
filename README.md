# viz_dstat_lite

Visualize dstat results on a web page.

Modified scripts from:
https://github.com/jschaub30/viz_dstat

# Requires
- [python 3](https://www.python.org/) - Unless running via Docker (see below)
- Assumes you have generated a series of dstat csv reports 
- [Docker](https://www.docker.com) (if you cannot run Python 3 or need to run this via CI instance such as Jenkins)

Also uses [Dygraphs](http://dygraphs.com/) for javascript charts (included)

## Visualize existing file locally:

From the project directory, just run

```
 ./viz_dstat.sh report1.csv,report2.csv,report3.csv,...etc
```

Then point your browser to http://localhost:12121

Each report can be viewed independently outside of the tabbed interface by going to: 
http://localhost:12121/index<insert report id>.html

Note that this currently only supports up to 3 concurrent reports. 

## Visualize existing files with Docker

To visualize reports within a Docker container (recommended for CI instances or for Python 2 users):

```
 Docker build viz-dstat-lite
```

Then

```
 Docker run -t -p 80:12121 viz-dstat-lite report1.csv,report2.csv,...
```

You can then view the report at http://localhost:80

## To Dos:

- Modify script to dynamially append tabs for reports beyond initial 3
