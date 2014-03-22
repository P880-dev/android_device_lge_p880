#define CONTROL_PERMS_APPEND \
    { "rawip_rmnet1",  AID_RADIO,  AID_RADIO }, \
    { "rawip_rmnet2",  AID_RADIO,  AID_RADIO }, \
    { "rmnet1_down",   AID_RADIO,  AID_RADIO }, \
    { "rmnet2_down",   AID_RADIO,  AID_RADIO }, \
    { "insmod_rawip",  AID_RADIO,  AID_RADIO }, \
    { "rmmod_rawip",   AID_RADIO,  AID_RADIO },

#define PROPERTY_PERMS_APPEND \
    { "net.pdp",             AID_RADIO,  AID_RADIO }, \
    { "net.pdp1",            AID_RADIO,  AID_RADIO }, \
    { "net.pdp2",            AID_RADIO,  AID_RADIO }, \
    { "net.rmmod.svc_done",  AID_RADIO,  AID_RADIO }, \
    { "media.tegra",         AID_MEDIA,  0 },
