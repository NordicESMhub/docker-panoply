# docker-panoply

Docker container for running panoply netCDF, HDF and GRIB data viewer

```
docker run --rm -p 5800:5800 -p 5900:5900 \
       -v /opt/uio/docker-ppp/data:/opt/data docker-panoply:1.0
```

### Reference 

- [Panoply](https://www.giss.nasa.gov/tools/panoply/) plots geo-referenced and other arrays from netCDF, HDF, GRIB, and other datasets.
- The docker container is based on https://github.com/jlesage/docker-baseimage-gui
