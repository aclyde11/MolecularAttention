import torch.nn as nn
import torchvision.models as models

class ImageModel(nn.Module):

    def __init__(self, intermediate_rep=128,  nheads=1, outs=1):
        super(ImageModel, self).__init__()
        self.return_attn = True
        self.outs = outs
        self.nheads = nheads

        resnet18 = models.resnet101(pretrained=True)
        resnet18 = nn.Sequential(*list(resnet18.children())[:-1])
        self.resnet181 = nn.Sequential(*list(resnet18.children())[:5])
        self.resnet182 = nn.Sequential(*list(resnet18.children())[5:])
        self.attention = nn.Sequential(
            nn.Conv2d(256, nheads, kernel_size=5, padding=2, stride=1),
        )

        self.model = nn.Sequential(
            nn.Linear(2048, intermediate_rep),
            nn.BatchNorm1d(intermediate_rep),
        )

        self.prop_model = nn.Sequential(
            nn.Linear(intermediate_rep, intermediate_rep),
            nn.ReLU(),

            nn.Linear(intermediate_rep, self.outs)
        )


    def forward(self, features):
        image = self.resnet181(features)
        attention = self.attention(image)
        attention = nn.functional.softmax(attention.view(attention.shape[0], self.nheads, -1), dim=-1).view(attention.shape)
        attention = attention.repeat([1, int(256 / self.nheads), 1, 1])
        image = self.resnet182(image * attention)
        image = image.view(features.shape[0], -1)

        if self.return_attn:
            return self.prop_model(self.model(image)), attention
        else:
            return self.prop_model(self.model(image))
