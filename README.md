# viz_dstat_lite
Visualize dstat results on a web page.

Modified scripts from:
https://github.com/jschaub30/viz_dstat

#Requires
- [python 3](https://www.python.org/)
- Assumes you have generated a series of dstat csv reports 

Also uses [Dygraphs](http://dygraphs.com/) for javascript charts (included)

##Visualize existing file
```
$ ./viz_dstat.sh report1.csv,report2.csv,report3.csv,...etc
```

Then point your browser to http://localhost:12121

Each report can be viewed independently outside of the tabbed interface by going to: 
http://localhost:12121/index<insert report id>.html

To Dos:

- Modify script to dynamially append tabs for reports beyond initial 3
- Dockerize this so we can put it into a CI instance
