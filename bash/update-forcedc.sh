#!/bin/bash

date

/home/eouser/force-schedule/bash/ingest-sentinel2.sh && \
/home/eouser/force-schedule/bash/ingest-landsat.sh && \
/home/eouser/force-schedule/bash/process-sentinel2.sh && \
/home/eouser/force-schedule/bash/process-landsat.sh && \
/home/eouser/force-schedule/bash/ard-report.sh && \
/home/eouser/force-schedule/bash/ard-delete-logs.sh && \
sudo reboot

