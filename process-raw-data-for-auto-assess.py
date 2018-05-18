'''

This is a script to generate data for input to auto assess from raw UM model output

This command gives the following output:

    command = fcm cat https://code.metoffice.gov.uk/svn/cma/autoassess/branches/dev/paulearnshaw/2017.12.02_rm_create_valnote/autoassess/moose_queries/stratosphere.monthly.g.txt@760

    output  =

        begin
            stash = (30201, 30204, 30205)
            lbproc = 192
        end
        begin
            stash = 34150
            lbproc = 128
        end

Information on lbproc can be found here https://code.metoffice.gov.uk/doc/um/latest/papers/umdp_F03.pdf

In this example lbproc = 192 = 64 + 128 which indicates a time mean (128) zonal mean (64) field and lbproc = 128 indicates a time mean field.
        
'''

#Import some modules

import iris
import iris.analysis
import mule

#Let's read in some raw model data...

stashcode=['m01s30i201','m01s30i204','m01s30i205','m01s34i150']

stash = iris.AttributeConstraint(STASH=stashcode[0])

var30201 = iris.load_cube('/home/williamsjh/cylc-run/u-ai955/share/data/History_Data/ai955a.pg19880901',stash)

stash = iris.AttributeConstraint(STASH=stashcode[1])

var30204 = iris.load_cube('/home/williamsjh/cylc-run/u-ai955/share/data/History_Data/ai955a.pg19880901',stash)

stash = iris.AttributeConstraint(STASH=stashcode[2])

var30205 = iris.load_cube('/home/williamsjh/cylc-run/u-ai955/share/data/History_Data/ai955a.pg19880901',stash)

stash = iris.AttributeConstraint(STASH=stashcode[3])

var34150 = iris.load_cube('/home/williamsjh/cylc-run/u-ai955/share/data/History_Data/ai955a.pg19880901',stash)

#Now we want to calculate some zonal means...

var30201_zm = var30201.collapsed('longitude',iris.analysis.MEAN)
var30204_zm = var30204.collapsed('longitude',iris.analysis.MEAN)
var30205_zm = var30205.collapsed('longitude',iris.analysis.MEAN)

#let's print the variables to the screen

print var30201_zm
print var30204_zm
print var30205_zm
print var34150









