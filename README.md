# LAVA-M fuzzing results (AFL)
Some results from fuzzing LAVA-M using different configurations of AFL and instrumentation with different Sanitizer.

## The fuzzed Korpus (LAVA-M)
The fuzzing targets were the LAVA-M corpus downloadable from [moyix.net](http://panda.moyix.net/~moyix/lava_corpus.tar.xz). More specific the four coreutils `base64`, `md5sum`, `uniq`, and `who`, each injected with a number of bugs. This is the automatically generated bug corpora used in the paper ["LAVA: Large-scale Automated Vulnerability Addition"](https://ieeexplore.ieee.org/document/7546498).

## Used target configurations

| Identifier:   | Used compiler flags: | AFL's quick-and-dirty mode (`-d`): | Datafile prefix: |
|:--------------|:---------------------|:----------------------------------:|:-----------------|
| normal        | `-fsanitize=thread,undefined`                                                                                                     |   | `afl-out-wo-trace`           |
| ASAN          | `-fsanitize=address,thread,undefined`                                                                                             |   | `afl-out-ASAN-wo-trace`      |
| ASAN + trace  | `-fsanitize=address,thread,undefined` `-fprofile-arcs` `-ftest-coverage`  `-fsanitize-coverage=bb,trace-pc-guard`                 |   | `afl-out-ASAN`               |
| trace         | `-fsanitize=thread,undefined`   `fprofile-arcs` `-ftest-coverage`  `-fsanitize-coverage=bb,trace-pc-guard`                        |   | `afl-out-trace`              |
| normal       (quick + dirty) | `-fsanitize=thread,undefined`                                                                                      | X | `afl-out-wo-trace-dump`      |
| ASAN         (quick + dirty) | `-fsanitize=address,thread,undefined`                                                                              | X | `afl-out-ASAN-wo-trace-dump` |
| ASAN + trace (quick + dirty) | `-fsanitize=address,thread,undefined` `-fprofile-arcs` `-ftest-coverage`  `-fsanitize-coverage=bb,trace-pc-guard`  | X | `afl-out-ASAN-dump`          |
| trace        (quick + dirty) | `-fsanitize=thread,undefined`   `fprofile-arcs` `-ftest-coverage`  `-fsanitize-coverage=bb,trace-pc-guard`         | X | `afl-out-trace-dump`         |

## Structure

- `data/` includes all measurement data for the 8 target configurations of the 4 fuzzing targets
- `plots/` some plots generated with gnuplot from the measurement data
- `base64-harvesting-results.sh` example script that captures `gcovr`-coverage data from discovered path's (AFL) for base64 and writes data files `*-cov.dat` with structure `<all lines> <not covered lines> <covered lines>`
- `aggregate.sh <directory>` aggregates the coverage data from the harvesting script with the timestampts from AFLs `plot_data`-files and writes data files `*-covtime.dat` with structure `<relative time [s]> <covered lines>`
- `plots.gnuplot` gnuplot-script for generating the plots in the `plots` directory