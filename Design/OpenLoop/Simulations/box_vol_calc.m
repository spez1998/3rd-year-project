%%%%%% USER EDITS GO HERE %%%%%%

%%% SPECIFICATION BLOCK %%%
% Add loudspeaker Thiele-Smalll parameters here
Cms_spec = 0.00063
Bl_spec = 6.16
VAS_spec = 15.38
fs = 52.2
Xmax = 0.004
Mms = 0.0148
Z_nom = 4
speaker_face_diameter = 0.165 % Also known as Sd

% Select MDF thickness and define mounting face dimensions
mdf_thickness = 0.012
mounting_face_length_ext = 0.200
mounting_face_width_ext = 0.200

% Choose new resonant frequency
f_above = 100 

%%%%%% USER EDITS END HERE %%%%%%

a_above = (2*pi*f_above)^2 * Xmax
F_above = Mms * a_above
Ip_above = F_above / Bl_spec
poweramp_above = (Ip_above/sqrt(2))^2 * Z_nom

%%% Ideal box size for Xmax
Ip = sqrt(poweramp_above / Z_nom)*sqrt(2)
F_req = Ip * Bl_spec
Cms_box = Xmax / F_req
VAS_box = (Cms_box / Cms_spec)*VAS_spec
V_box = (VAS_box*VAS_spec)/(VAS_spec-VAS_box)

%%% BELOW RESONANCE POWER REQUIREMENTS %%%
VAS_box = (VAS_spec * V_box)/(VAS_spec + V_box)
Cms_box = (VAS_box/VAS_spec) * Cms_spec
fb = fs*sqrt(VAS_spec / VAS_box)
F_req = Xmax / Cms_box
Ip = F_req / Bl_spec
P_diss = (3.4 * (Ip)^2)/2
four_ohm_poweramp_below = (((Ip)^2)/2) * 4
eight_ohm_poweramp_below = (((Ip)^2)/2) * 8

%%% DIMENSIONS %%%
int_vol = V_box / 1000
box_depth_int = int_vol / ((mounting_face_length_ext-(2*mdf_thickness)) * (mounting_face_length_ext-(2*mdf_thickness)))
box_depth_ext = (2*mdf_thickness) + box_depth_int

int_vol = V_box / 1000
mdf_thickness = 0.012
speaker_face_diameter = 0.165
mounting_face_length_ext = 0.200
mounting_face_width_ext = 0.200
mounting_face_length_int = mounting_face_length_ext-(2*mdf_thickness)
mounting_face_width_int = mounting_face_width_ext-(2*mdf_thickness)
int_depth = int_vol / (mounting_face_length_int*mounting_face_width_int)
top_bottom_length = int_depth
top_bottom_width = mounting_face_width_ext