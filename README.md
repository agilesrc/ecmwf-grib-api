# Unofficial ECMWF GRIB-API image

<img src="https://software.ecmwf.int/wiki/download/attachments/589870/GRIB?version=6&modificationDate=1347029083081&api=v2"/>

The ECMWF GRIB API is an application program interface accessible from C, FORTRAN and Python programs 
developed for encoding and decoding WMO FM-92 GRIB edition 1 and edition 2 messages. A useful set of 
command line tools is also provided to give quick access to GRIB messages.

# Reference

Official documentation about ECWMF GRIB-API can be found at <a href="https://software.ecmwf.int/wiki/display/GRIB">here</a>

# Usage

There are a number of command line tools that come with the GRIB-API.  These include:


*   grib_compare : Compare grib messages contained in two files. If some differences are found it fails returning an error code. Floating-point values are compared exactly by default, different tolerances can be defined see switches -P, -A and -R. Default behaviour: absolute error=0, bit-by-bit compare, same order in files. Full reference: https://software.ecmwf.int/wiki/display/GRIB/grib_compare
*   grib_copy : Copies the content of GRIB files printing values of some keys. Full reference: https://software.ecmwf.int/wiki/display/GRIB/grib_copy
*	grib_count : Print the total number of GRIB messages in the given files.  Full reference: https://software.ecmwf.int/wiki/display/GRIB/grib_count
*	grib_dump : Dump the content of a GRIB file in different formats.  Full reference: https://software.ecmwf.int/wiki/display/GRIB/grib_dump
*	grib_filter : Apply the rules defined in rules_file to each GRIB message in the GRIB files provided as arguments.
If you specify '-' (a single dash) for the rules_file, the rules will be read from standard input.  Full reference: https://software.ecmwf.int/wiki/display/GRIB/grib_filter
*	grib_get : Get values of some keys from a GRIB file. It is similar to grib_ls, but fails returning an error code when an error occurs (e.g. key not found).  Full reference: https://software.ecmwf.int/wiki/display/GRIB/grib_get
*	grib_get_data : Print a latitude, longitude, data values list.  Full reference: https://software.ecmwf.int/wiki/display/GRIB/grib_get_data
*	grib_index_build : Build an index file for a set of input GRIB files. Full reference: https://software.ecmwf.int/wiki/display/GRIB/grib_index_build
*	grib_info : Print information about the version of GRIB API, the default definitions and samples path. If the environment variables GRIB_DEFINITION_PATH and/or GRIB_SAMPLES_PATH are defined, then their values will be printed.  Full reference: https://software.ecmwf.int/wiki/display/GRIB/grib_info
*	grib_ls : List content of GRIB files printing values of some keys. It does not fail when a key is not found. Full reference: https://software.ecmwf.int/wiki/display/GRIB/grib_ls
*	grib_set: Sets key/value pairs in the input GRIB file and writes each message to the output_grib_file. It fails when an error occurs (e.g. key not found). Full reference: https://software.ecmwf.int/wiki/display/GRIB/grib_set
*	grib_to_netcdf : Convert a GRIB file to NetCDF format.
Note: The GRIB geometry should be a regular lat/lon grid or a regular Gaussian grid (the key "typeOfGrid" should be "regular_ll" or "regular_gg").  Full reference: https://software.ecmwf.int/wiki/display/GRIB/grib_to_netcdf

All are located in /usr/local/bin

There are two volumes mapped that can be used for interaction with GRIB command line tools  These are _/input_ and _/output_

the following are are some examples

```
docker run -it --rm -v `pwd`:/input ecmwf-grib-api /usr/local/bin/grib_ls /input/gfs.t00z.pgrb2.1p00.f006
```

The above example maps the current directory to /input and runs grib_ls on a local file called gfs.t00z.pgrb2.1p00.f006
and will produce output like the following:

> 
edition      centre       date         dataType     gridType     stepRange    typeOfLevel  level        shortName    packingType  
2            kwbc         20160309     fc           regular_ll   6            unknown      0            u            grid_complex_spatial_differencing 
2            kwbc         20160309     fc           regular_ll   6            unknown      0            v            grid_complex_spatial_differencing 
2            kwbc         20160309     fc           regular_ll   6            unknown      0            unknown      grid_complex_spatial_differencing 
2            kwbc         20160309     fc           regular_ll   6            surface      0            gust         grid_complex_spatial_differencing
... 
>



