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

stash = iris.AttributeConstraint(STASH='m01s30i201')

var = iris.load('/home/williamsjh/cylc-run/u-ai955/share/data/History_Data/ai955a.pg19880901',stash)

# what does it 'look' like?
print var

#Now we want the zonal mean of this...

var_zm = var[0].collapsed('longitude',iris.analysis.MEAN)

print var_zm









