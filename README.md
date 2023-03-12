# world2image

QUESTION 1)
First I downloaded the map in the latitude and longitude range entered from the open street map.
 
QUESTION 2)
I extracted the z values of the building coordinates from the als image and transferred it to the excel file in QGIS. The methods I use are: extract vertices, drape (set z value from raster), extract z values.
 

QUESTION 3)
I indicated the necessary steps to make the transformation with screenshots. I made the transformation by following these steps. I have obtained the parameters u and v at the end of this process.
 
I defined the values given to me in the matlab.
 
   
I specified my actions with the comment line.
QUESTION 4)
When I made the plot draw, I added the image I got as a screen photo.
  
 
I could not draw the boundaries of the building with coordinates. That's why all the lines are connected. Are the corner coordinates of the buildings that appear in pink. The yellow ones are the lines.






QUESTION 5)
I did not encounter any major problems while obtaining my data. My only drawback is that while applying these topics, I am unable to understand the formations of some matrixes. I mean, theoretically, when I read the lecture notes, I can understand them, but I have some shortcomings in practice. While doing the transformation in question 3, I found out by trying hard what the problem was and what kind of output I should get. The libraries I researched while finding the edges of the buildings in question 4 did not solve my problem. I've tried the canny and sobel filters, which are some edge finder filters that I have found. Then I tried to write my own code but could not get it either. I could not combine the edge points for only 1 building, and each edge point is connected to each other. These are all the problems I encounter while doing this homework. The fact that some of the corner coordinates are not exactly in place may be inaccurate when making the point, the projections we use may be different. Considering the whole homework, I spent a lot of time on questions 3 and 4 and had to do a lot of research. I think the difficulty of the given homework is slightly above average.

