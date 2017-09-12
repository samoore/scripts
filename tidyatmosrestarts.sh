# mv files in pwd
#delete all february-september dumps
mv *a.da*[2-9]01_00  /nesi/projects/deepsouth/williamsjh/trash/
#delete all 11th of the month dumps
mv *a.da*11_00 /nesi/projects/deepsouth/williamsjh/trash/
#delete all 21st of the month dumps
mv *a.da*21_00 /nesi/projects/deepsouth/williamsjh/trash/
#delete all 1st of october dumps
mv *a.da*1001_00 /nesi/projects/deepsouth/williamsjh/trash/
#delete all 1st of november dumps
mv *a.da*1101_00 /nesi/projects/deepsouth/williamsjh/trash/

# mv files in directory containing cylc-run suite directories
mv */share/data/History_Data/*a.da*[2-9]01_00 /nesi/projects/deepsouth/williamsjh/trash/
mv */share/data/History_Data/*a.da*11_00 /nesi/projects/deepsouth/williamsjh/trash/
mv */share/data/History_Data/*a.da*21_00 /nesi/projects/deepsouth/williamsjh/trash/
mv */share/data/History_Data/*a.da*1001_00 /nesi/projects/deepsouth/williamsjh/trash/
mv */share/data/History_Data/*a.da*1101_00 /nesi/projects/deepsouth/williamsjh/trash/

#find ~/cylc-run/trash/ -type f -mtime +7 -name '*a.da*' -execdir rm -- {} \;

