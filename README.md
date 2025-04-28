# Eye for blind
 
## Clone repository

Open cmd

```bash

git clone https://github.com/HungDongne/Eye-for-blind.git

cd Eye-for-blind

```
## Create virtual environment and install dependencies

Create virtual environment *Make sure using Python 3.9.x*

```bash

python -m venv .venv

.venv\Scripts\activate

```
Install dependencies python

```bash

pip install -r requirements.txt

```
## How to running
```bash

python superman.py --video2frames True --videoName Final1.mp4 --use_cuda 0

```
**--videoName:** the name of video that want to warming walking

**--video2frames:** *True* if export video to frames in *video/(videoName)*

**--use_cuda:** *0* if you want using only CPU or *1* to using GPU