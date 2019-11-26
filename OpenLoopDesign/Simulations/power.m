%%% SPECIFICATION BLOCK %%%
Cms_spec = 0.00063
Bl_spec = 6.16
VAS_spec = 15.38
fs = 52.2
V_box = 3.2449
Xmax = 0.004
Mms = 0.0148
Z_nom = 4

%%% BELOW RESONANCE POWER REQUIREMENTS %%%
VAS_box = (VAS_spec * V_box)/(VAS_spec + V_box)
Cms_box = (VAS_box/VAS_spec) * Cms_spec
fb = fs*sqrt(VAS_spec / VAS_box)
F_req = Xmax / Cms_box
Ip = F_req / Bl_spec
P_diss = (3.4 * (Ip)^2)/2
poweramp = (Ip/sqrt(2))^2 * Z_nom


%%% ABOVE RESONANCE POWER REQUIREMENTS %%%
% Ip = 5.9460
% F_from_Ip = Ip * Bl_spec
% X_from_Ip = F_from_Ip * Cms_box

%%% Ideal box size for Xmax = 4mm
poweramp_rms = 70
Ip = sqrt(poweramp_rms / Z_nom)*sqrt(2)
F_req = Ip * Bl_spec
Cms_box = Xmax / F_req
VAS_box = (Cms_box / Cms_spec)*VAS_spec
Vbox = (VAS_box*VAS_spec)/(VAS_spec-VAS_box)