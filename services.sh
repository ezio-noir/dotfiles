#!/bin/bash

systemctl --user enable --now hyprpolkitagent.service

systemctl --user enable --now hypridle.service
