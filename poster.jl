using Luxor

# Convert inches to points (1 inch = 72 points)
width_pt = 24 * 72  # 1728 points
height_pt = 36 * 72 # 2592 points

# Create the drawing
Drawing(width_pt, height_pt, "poster.pdf")

# Set white background
background("white")

# Draw blue banner at top
banner_height = height_pt/6.5
setcolor("#739fcf")
box(Point(width_pt/2, banner_height/2), width_pt, banner_height, :fill)

# Add title text in banner
fontsize(60)
fontface("Helvetica-Bold")
setcolor("black")
text("The State of", Point(width_pt/3-150, (banner_height/2)-20), halign=:right)
text("for Scientific Machine Learning", Point((2*width_pt/3)-420, (banner_height/2)-20), halign=:left)

# Add authors below banner
fontsize(50)
text("Edward Berman* and Jacob Ginesin*", Point((width_pt/3)+385, banner_height - 100), halign=:right)

# Add Julia logo in banner between text
gsave()
translate((width_pt/2)-290, (banner_height/2)-80)
scale(0.9)  # Adjust size of logo as needed
julialogo(centered=true)
grestore()


# Add "We characterize..." text
fontsize(56)
text("We characterize Julia's main limitations as...", Point((width_pt/2)-230, banner_height + 90), halign=:center)

# Move to center of poster for circles
translate(width_pt/2, height_pt/2)

# Draw Julia circles
R = 400
juliacircles(R)

# Set up text style for circle labels
fontsize(50)
fontface("Helvetica-Bold")
setcolor("black")

# Add text above each circle using text() and manual positioning
# Green circle (top)
text("Lack of Software", Point(0, -R - 50), halign=:center)
text("Engineering", Point(0, -R), halign=:center)
text("Features", Point(0, -R+50), halign=:center)

# Red circle (bottom left)
text("Complex", Point(-R + 50, R-250), halign=:center)
text("Debugging", Point(-R + 50, R-200), halign=:center)
text("Messages", Point(-R + 50, R-150), halign=:center)

# Purple circle (bottom right)
text("Poor", Point(R-50, R-225), halign=:center)
text("Interoperability", Point(R-50, R-175), halign=:center)

# Reset transform for bottom text
translate(-width_pt/2, -height_pt/2)

# Add bottom text
fontsize(56)
text("...This manifests in", Point((width_pt/3)+425, height_pt - 650), halign=:center)
setfont("Helvetica-Bold", 56)
text("Low Adoption", Point((2*width_pt/3)+300, height_pt - 650), halign=:center)

# Add call to action text
fontsize(56)
setfont("Helvetica-Bold", 56)
text("Call to action: A new constitution of language goals for Julia", Point(50, height_pt - 400), halign=:left)
text("to enable its broader adoption for scientific machine learning", Point(50, height_pt - 320), halign=:left)

# Add logos individually
# NEU logo
gsave()
translate(0, height_pt - 130)
img_ne = readpng("assets/neu.png")
scale(0.75, 0.75)  # Adjust scale as needed
placeimage(img_ne, Point(75, -img_ne.height/2))
grestore()

# NeurIPS logo
gsave()
translate(150, height_pt - 130)
img_nips = readpng("assets/neurips.png")
scale(0.39, 0.39)  # Adjust scale as needed
placeimage(img_nips, Point(350, -img_nips.height/2))
grestore()

# NeurIPS2 logo
gsave()
translate(200, height_pt - 48)
img_ipam = readpng("assets/neurips2.png")
scale(0.54, 0.54)  # Adjust scale as needed
placeimage(img_ipam, Point(1000, (-img_ipam.height/2)-150))
grestore()

# QR code
gsave()
translate(width_pt - 50, height_pt - 80)
img_qr = readpng("assets/qr-code.png")
scale(0.2, 0.2)  # Adjust scale as needed
placeimage(img_qr, Point(-900, -750))
grestore()

finish()
preview()
