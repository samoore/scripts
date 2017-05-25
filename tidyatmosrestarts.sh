# mv files in pwd
#delete all february-september dumps
mv *a.da*[2-9]01_00  /hpcf/working/williamsjh/cylc-run/trash
#delete all 11th of the month dumps
mv *a.da*11_00 /hpcf/working/williamsjh/cylc-run/trash
#delete all 21st of the month dumps
mv *a.da*21_00 /hpcf/working/williamsjh/cylc-run/trash
#delete all 1st of october dumps
mv *a.da*1001_00 /hpcf/working/williamsjh/cylc-run/trash
#delete all 1st of november dumps
mv *a.da*1101_00 /hpcf/working/williamsjh/cylc-run/trash

# mv files in directory containing cylc-run suite directories
mv */share/data/History_Data/*a.da*[2-9]01_00 /hpcf/working/williamsjh/cylc-run/trash
mv */share/data/History_Data/*a.da*11_00 /hpcf/working/williamsjh/cylc-run/trash
mv */share/data/History_Data/*a.da*21_00 /hpcf/working/williamsjh/cylc-run/trash
mv */share/data/History_Data/*a.da*1001_00 /hpcf/working/williamsjh/cylc-run/trash
mv */share/data/History_Data/*a.da*1101_00 /hpcf/working/williamsjh/cylc-run/trash

