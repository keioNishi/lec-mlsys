import torch
print("PyTorch Version:", torch.__version__)
print("CUDA Available:", torch.cuda.is_available())
print("CUDA # of Devices:", torch.cuda.device_count())
print("CUDA Device:", torch.cuda.get_device_name())
print("CUDA Compute Capability:", torch.cuda.get_device_capability())
print("CUDA Version:", torch.version.cuda)
print("CUDA Archtecture:", torch.cuda.get_arch_list())
print("CUDA Current Device ID:", torch.cuda.current_device())
