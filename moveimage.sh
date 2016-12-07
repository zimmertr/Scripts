#! /bin/bash
#############################################################################
#############################################################################
##moveimage.sh is a script to detect the resolution/size of an image and,  ##
##based on the results, organize it in a new directory. It was created by  ##
##me to help organize tens of thousands of image files that I recovered    ##
##from a friend's macbook after she accidentally deleted them so that she  ##
##wouldn't have to manually parse through them herself.                    ##
#############################################################################
#############################################################################

thumb128=0
thumb160=0
thumb200=0
lt20=0
bt20_50=0
bt50_150=0
bt150_500=0
bt500_1024=0
gt1024=0
total=0
iniDate=$(date)

echo "Started on: $iniDate"
echo ""
echo ""
#For each image in each subdirectory...
for f in */*.jpg; do 

    #If the resolution is 128x128, move to thumbnails
    if identify $f | grep 128x128 > /dev/null
        then
            cp $f /media/Data/Recovery/Thumbnails\ \-\ \(128x128\)/ > /dev/null
            echo "$f was copied to Thumbnails (128x128)"
            let thumb128+=1
    fi

    #If the resolution is 160x120, move to thumbnails
    if identify $f | grep 160x120 > /dev/null
        then
            cp $f /media/Data/Recovery/Thumbnails\ \-\ \(160x120\)/ > /dev/null
            echo "$f was copied to Thumbnails (160x120)"
            let thumb160+=1
    fi

    #If the resolution is 200x200, move to thumbnails
    if identify $f | grep 200x200 > /dev/null
        then
            cp $f /media/Data/Recovery/Thumbnails\ \-\ \(200x200\)/ > /dev/null
            echo "$f was copied to Thumbnails(200x200)"
            let thumb200+=1
    fi

    #Else, if the file size is less than 20kb...
    if [[ -n $(find $f -type f -size -20k 2>/dev/null) ]];
        then
            cp $f /media/Data/Recovery/Images\ Between\ 0KB\ and\ 20KB/ > /dev/null
            echo "$f was copied to 0 to 20kb"
            let lt20+=1
    fi

    #Else, if the file size is between 20 and 50...
    if [[ -n $(find $f -type f -size +20k -a -size -50k 2>/dev/null) ]];
        then
            cp $f /media/Data/Recovery/Images\ Between\ 20KB\ and\ 50KB/ > /dev/null
            echo "$f was copied to 20 to 50kb"
            let bt20_50+=1
    fi

    #Else, if the file size is between 50 and 150...
    if [[ -n $(find $f -type f -size +50k -a -size -150k 2>/dev/null) ]];
        then
            cp $f /media/Data/Recovery/Images\ Between\ 50KB\ and\ 150KB/ > /dev/null
            echo "$f was copied to 50 to 150kb"
            let bt50_150+=1
    fi
    
    #Else, if the file size is between 150 and 500...
    if [[ -n $(find $f -type f -size +150k -a -size -500k 2>/dev/null) ]];
        then
            cp $f /media/Data/Recovery/Images\ Between\ 150KB\ and\ 500KB/ > /dev/null
            echo "$f was copied to 150 to 500kb"
            let bt150_500+=1
    fi

    #Else, if the file size is between 500 and 1024...
    if [[ -n $(find $f -type f -size +500k -a -size -1024k 2>/dev/null) ]];
        then
            cp $f /media/Data/Recovery/Images\ Between\ 500KB\ and\ 1MB/ > /dev/null
            echo "$f was copied to 500 to 1024"
            let bt500_1024+=1
    fi

    #Else, if the file size is greater than 1024...
				if [[ -n $(find $f -type f -size +1M 2>/dev/null) ]];
        then
            cp $f /media/Data/Recovery/Images\ Over\ 1MB/ > /dev/null
            echo "$f was copied to over 1024"
            let gt1024+=1
    fi
done;

echo ""
echo ""
echo "Summary: "
echo ""
echo "Thumbnails (128x128): $thumb128"
echo "Thumbnails (160x120): $thumb160"
echo "Thumbnails (200x200): $thumb200"
echo "Files less than 20kb: $lt20"
echo "Files between 20kb and 50kb: $bt20_50"
echo "Files between 50kb and 150kb: $bt50_150"
echo "Files between 150kb and 500kb: $bt150_500"
echo "Files between 500kb and 1mb: $bt500_1024"
echo "Files greater than 1mb: $gt1024"
echo ""
let total=thumb128+thumb160+thumb200+lt20+bt20_50+bt50_150+bt150_500+bt500_1024+gt1024
echo "Total Files copied: $total"
echo ""
finDate=$(date)
echo "Completed on: $finDate"
