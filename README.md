# Minimalist MATLAB Template for Scientific Figures

This repository contains a MATLAB template to create scientific figures. The template carefully follows [data visualization best practices](https://www.edwardtufte.com/tufte/books_vdqi).

## Documentation

The template is documented at https://pascalmichaillat.org/d/.

## Illustration

The figures produced by the template can be viewed at https://pascalmichaillat.org/d4.pdf.

## Usage

+ Clone the repository to your local machine.
+ Open the repository with MATLAB.
+ Run `publish('figures.m')` in MATLAB to generate an HTML page at `html/figures.html` in the repository. The page can be opened in any web browser. It displays the MATLAB code and its output. This is the best way to see the figures produced by the template, and to experiment with the template.
+ Use any part of the template defined in `figures.m` to produce figures for your project.
+ On a Mac, the figures can easily be annotated with Keynote. This procedure is more user friendly, and more flexible, than annotating the figures directly in MATLAB. The Keynote file `figures.key` illustrates how to annotate the figures produced by the template. The main step is to insert the image produced by MATLAB as a background to the slide using `Image Fill` with the option `Scale to Fill`.
+ The `figures.key` file can then be exported as a PDF file so the figures can be used elsewhere. The `figures.pdf` file is obtained by exporting `figures.key`.

## Software

The template was developed, tested, and validated on Apple Silicon Mac with MATLAB R2023B.

While the template should also work on other operating systems and with other MATLAB versions, compatibility cannot be guaranteed. Users on Windows or Linux systems, or those using different MATLAB versions, may need to make minor adjustments. [Please report](https://github.com/pmichaillat/matlab-figures/issues) any compatibility issues or bugs to help improve cross-platform support.

## License

This repository is licensed under the [MIT License](LICENSE.md).
