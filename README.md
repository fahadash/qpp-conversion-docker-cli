To use:

Launch bash or powershell, change directory into the cloning directory and run the following command to build a container

```bash
docker build -t qpp-conversion-cli:latest ./
```

Create a local directory on your computer where you keep your QRDA files for validation, following example assumes that your directory is /tmp/qrda-files  or c:\temp\qrda-files in windows.

```bash
docker run --rm -v /tmp/qrda-files:/qrda qpp-conversion-cli filename.xml
```

In the above example, the filename.xml must be a QRDA file you want to validate and it must exist in your path (/tmp/qrda-files or c:\temp\qrda-files for windows).

At the end of each run, the resultant file will be copied to /results directory under your qrda-files directory.
