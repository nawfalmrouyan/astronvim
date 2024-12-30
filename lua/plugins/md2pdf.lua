return {
  {
    "alexxGmZ/Md2Pdf",
    enabled = false,
    cmd = "Md2Pdf",
    config = function()
      require("Md2Pdf").setup {
        pdf_engine = "pdflatex",
        yaml_template_path = "/home/opal/Projects/zk/.zk/templates/pdf.yml",
      }
    end,
  },
}
