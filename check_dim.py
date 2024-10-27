import fitz 

pdf_path = "poster.pdf"
pdf_document = fitz.open(pdf_path)

for page_num in range(pdf_document.page_count):
    page = pdf_document[page_num]
    width_pt, height_pt = page.rect.width, page.rect.height
    width_in = width_pt / 72  
    height_in = height_pt / 72
    print(f"Page {page_num + 1}: {width_in:.2f} x {height_in:.2f} inches")

