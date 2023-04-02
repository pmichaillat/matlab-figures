# Minimalist MATLAB Template for Scientific Figures

This repository contains a MATLAB template to create scientific figures. The template carefully follows [best practices for data visualization](https://www.edwardtufte.com/tufte/books_vdqi).

## Documentation

The template is documented at https://pascalmichaillat.org/d/.

## Illustration

The figures produced by the template can be viewed at https://pascalmichaillat.org/d.pdf.

## Usage

+ Clone the repository to your local machine.
+ Open MATLAB and set the repository as the current folder.
+ Run `publish('figures.m')` in MATLAB to generate an HTML page at `html/figures.html`. The page can be opened in any web browser. It displays the MATLAB code and its output. This is a good way to see the figures produced by the template, and to experiment.
+ Use any part of the template defined in `figures.m` to produce figures for your project.
+ On a Mac, the figures can easily be annotated with Keynote. This procedure is more user-friendly and more flexible than directly annotating the figures in MATLAB. The Keynote file `figures.key` illustrates how to annotate the figures. The main step is to insert the image produced by MATLAB as a background to the slide using `Image Fill` with the option `Scale to Fill`.
+ The `figures.key` file can then be exported as a PDF file so the figures can be used elsewhere. The `figures.pdf` file is obtained by exporting `figures.key`.

## Software

+ The template was developed using MATLAB R2023B on macOS Sonoma (Apple silicon).
+ Other MATLAB releases and operating systems may require minor adjustments. Please [report any issues](https://github.com/pmichaillat/matlab-figures/issues) to help improve compatibility.

## License

This repository is licensed under the [MIT License](LICENSE.md).