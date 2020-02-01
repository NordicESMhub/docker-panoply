# docker-panoply

Docker container for running panoply netCDF, HDF and GRIB data viewer

```
docker run --rm -p 5800:5800 -p 5900:5900 \
       -v /opt/uio/docker-ppp/data:/opt/data docker-panoply:1.0
```
