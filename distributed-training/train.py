import os
import torch
from torch import nn
import torch.nn.functional as F
from torchvision.datasets import MNIST
from torch.utils.data import DataLoader, random_split
from torchvision import transforms
import lightning as pl
import LightningModule as L

# setup data
dataset = MNIST(os.getcwd(), download=True, transform=L.ToTensor())
train_loader = torch.utils.data.DataLoader(dataset)

# train the model (hint: here are some helpful Trainer arguments for rapid idea iteration)
trainer = L.Trainer(limit_train_batches=100, max_epochs=10)
trainer.fit(model=L.autoencoder, train_dataloaders=train_loader)
