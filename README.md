# Link Checker
[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-Link%20Checker-blue.svg?colorA=24292e&colorB=0366d6&style=flat&longCache=true&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAM6wAADOsB5dZE0gAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAERSURBVCiRhZG/SsMxFEZPfsVJ61jbxaF0cRQRcRJ9hlYn30IHN/+9iquDCOIsblIrOjqKgy5aKoJQj4O3EEtbPwhJbr6Te28CmdSKeqzeqr0YbfVIrTBKakvtOl5dtTkK+v4HfA9PEyBFCY9AGVgCBLaBp1jPAyfAJ/AAdIEG0dNAiyP7+K1qIfMdonZic6+WJoBJvQlvuwDqcXadUuqPA1NKAlexbRTAIMvMOCjTbMwl1LtI/6KWJ5Q6rT6Ht1MA58AX8Apcqqt5r2qhrgAXQC3CZ6i1+KMd9TRu3MvA3aH/fFPnBodb6oe6HM8+lYHrGdRXW8M9bMZtPXUji69lmf5Cmamq7quNLFZXD9Rq7v0Bpc1o/tp0fisAAAAASUVORK5CYII=)](https://github.com/marketplace/actions/link-checker)

A GitHub action for link checking repository Markdown and HTML files.

When used in conjunction with [Create Issue From File](https://github.com/peter-evans/create-issue-from-file), issues will be created when Link Checker finds connectivity problems with links.

## Usage

Link Checker uses [Liche](https://github.com/raviqqe/liche).
Liche arguments should be passed to the action via the `args` parameter.
This example will check all markdown and HTML files in your repository.

```yml
    - name: Link Checker
      uses: peter-evans/link-checker@v1
      with:
        args: -v -r *
```

See [Liche's documentation](https://github.com/raviqqe/liche) for further argument details.

#### Optional environment variables

If Link Checker finds connectivity problems with links the action will output a markdown file containing the error report.
The default path is `link-checker/out.md`. The path and filename may be overridden with the following variables.

- `LINKCHECKER_OUTPUT_DIR` - The output directory the markdown error report
- `LINKCHECKER_OUTPUT_FILENAME` - The error report filename

#### Receiving issues containing the error report

Below is an example of using this action in conjunction with [Create Issue From File](https://github.com/peter-evans/create-issue-from-file). The workflow executes on a schedule every month. Issues will be created when Link Checker finds connectivity problems with links.

```yml
on:
  schedule:
  - cron: '0 0 1 * *'
name: Check markdown links
jobs:
  linkChecker:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Link Checker
        uses: peter-evans/link-checker@v1
        with:
          args: -v -r *
      - name: Create Issue From File
        uses: peter-evans/create-issue-from-file@v2
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          title: Link Checker Report
          content-filepath: ./link-checker/out.md
          labels: report, automated issue
```

## Issue sample

[This link](https://aoushaoueshosuhoshuoeu.com) is intentionally non-existent.
The workflow in this repository generated [this sample issue](https://github.com/peter-evans/link-checker/issues/1).

## License

MIT License - see the [LICENSE](LICENSE) file for details
