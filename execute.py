import subprocess

# Test with only sketch
# subprocess.run("python test.py --dataroot ./datasets/facades/testB/ --name facades_pix2pix --model test --netG unet_256 --direction BtoA --dataset_mode single --norm batch", shell=True)

# With only pytorch CPU
# requirement
"""
pip install torch==1.6.0+cpu torchvision==0.7.0+cpu -f https://download.pytorch.org/whl/torch_stable.html
conda install pytorch-cpu torchvision-cpu -c pytorch
"""
subprocess.run("python test.py --dataroot ./datasets/facades/testB/ --name facades_pix2pix --model test --netG unet_256 --direction BtoA --dataset_mode single --norm batch --gpu_ids -1 --results_dir C:/Users/Administrator/Desktop", shell=True)

# subprocess.run('python test.py --dataroot ./datasets/facades --name facades_pix2pix --model pix2pix --direction BtoA', shell=True)