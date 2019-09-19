`ADD ONT LOGO`
**************************

# 1. Introduction 

### Overview:
???
### Features:
???


# 2. Getting started

In most cases, it is best to pre-install conda before starting. All other dependencies will be installed automatically when running the pipeline for the first time. 

### Requirements:

This pipleine requires a computer running Linux (Ubuntu 16). >64Gb of memory would be recommended. The pipeline has been tested on minimal server installs of these operating systems.

Most software dependecies are managed using *conda*. To install conda, please install [miniconda3](https://conda.io/miniconda.html) and refer to installation [instructions](https://conda.io/projects/conda/en/latest/user-guide/install/index.html).
You will need to accept the license agreement during installation and we recommend that you allow the Conda installer to prepend its path to your .bashrc file when asked.
```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```
Check if the conda has successfully installed
```
conda -h
```
If conda has installed correctly, you should see the follow output.
If you do not see the below output, you may need to close and reopen your terminal.

```
$ conda
usage: conda [-h] [-V] command ...

conda is a tool for managing and deploying applications, environments and packages.

Options:

positional arguments:
  command
    clean        Remove unused packages and caches.
    config       Modify configuration values in .condarc. This is modeled
                 after the git config command. Writes to the user .condarc
                 file (/Users/prughani/.condarc) by default.
    create       Create a new conda environment from a list of specified
                 packages.
..............
```


#### Installation:

Clone *Pore-c Snakemake* git repository from https://git.oxfordnanolabs.local/genomic_apps_projects/pore-c-snakemake
A snakemake pipeline to drive the analysis of pore-C data. This workflow follows the format of those in the [Snakemake-Workflows](https://github.com/snakemake-workflows) project.

1. Create a new github repository using this workflow [as a template](https://help.github.com/en/articles/creating-a-repository-from-a-template).
2. [Clone](https://help.github.com/en/articles/cloning-a-repository) the newly created repository to your local system, into the place where you want to perform the data analysis.


```
git clone https://git.oxfordnanolabs.local/genomic_apps_projects/pore-c-snakemake.git
cd pore-c-snakemake
## Creates environment and the dependencies will install automatically 
conda env create
conda activate pore_c_snakemake
```
***********

# 3. Usage

#### Configure workflow:

Configure the workflow according to your needs via editing the file `config.yaml`.

#### Add basecall localation:

Add the basecall locations to `basecall.tsv`. The run IDs must *not* contain any spaces or special characters. The FASTQ file must be an aggregated copy of the multiple fastq (including from fastq_failed folder) files generated by the ONT platfrom from a single runs and compressed with [gzip](https://www.gnu.org/software/gzip/manual/gzip.html)

#### Execute workflow:

Test your configuration by performing a dry-run via

    snakemake --use-conda -n

Execute the workflow locally via

    snakemake --use-conda --cores $N

using `$N` cores or run it in a cluster environment via

    snakemake --use-conda --cluster qsub --jobs 100

or

    snakemake --use-conda --drmaa --jobs 100

If you not only want to fix the software stack but also the underlying OS, use

    snakemake --use-conda --use-singularity

in combination with any of the modes above.
See the [Snakemake documentation](https://snakemake.readthedocs.io/en/stable/executable.html) for further details.

### Testing:

Test cases are in the subfolder `.test`. They are automtically executed via continuous integration with Travis CI and requires [git lfs](https://github.com/git-lfs/git-lfs/wiki/Installation) to be installed.

# 4. Output files
Once the pipeline has run successfully you should expect the following files in the output directoy:

*  **`align_table/`:**
    *  `*.at.alignment.parquet` - records containing all alignment information in parquet format
    *  `*.at.alignment_summary.csv` - alignment summary table
    *  `*.at.overlap.parquet` - overlaps...????
    *  `*.at.read.parquet` - records containing read information such as mean qscore and read length
    *  `*.at.read_summary.csv` - summary stats of input reads, such as read N50
*   **`basecall/`:** 
    *   `*.rd.pass.fq.gz` - basecall that have pass filtering
    *   `*.rd.read_metadata.parquet` ???
    *   `*.rd.stats.tsv` - ???
    *   `*.rd.summary.csv` - Is this same as read_summary.csv ???
*   **`mapping/`:**
    *   `*.read_sort.bam` - sorted bam alignment file
*   **`matrix/`**
    *   `*.matrix.coo.csv.gz` - ???
    *   `*.matrix.cool` - ???
    *   `*.matrix.balanced.mcool` - ???
    *   `*.matrix.counts.mcool` - ???
*   **`pairs/`:**
    *   `*.pairs.1k.cooler` - ??
    *   `*.pairs.pairs.gz` - contains fragment position and fragment pairs
*   **`refgenome/`:**
    *   `*.rg.metadata.csv` ???
    *   `*.rg.chromsizes`- reference genome chromosome lengths
    *   `*.rg.fa.gz` - reference genome compressed with bgzip
    *   `*.rg.fa.gz.fai` - samtools indexed reference genome
    *   `*..rg.fa.gz.bwt` - bwa index referenece genome
*   **`virtual_digest/`:**
    *   `*.vd.digest_stats.csv` - virual digest stats
    *   `*.vd.fragments.parquet` - virual digest coordinates 

# 5. Help

#### Licence and Copyright:
© 2019 Oxford Nanopore Technologies Ltd.

Bioinformatics-Tutorials is distributed by Oxford Nanopore Technologies under the terms of the MPL-2.0 license.


