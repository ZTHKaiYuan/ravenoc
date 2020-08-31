`ifndef _ravenoc_structs_
  `define _ravenoc_structs_
  // Usage of s_ = struct / _t = typedef
  typedef enum logic [1:0] {
    HEAD_FLIT,
    BODY_FLIT,
    TAIL_FLIT
  } flit_type_t;

  //typedef enum logic [4:0] {
    //NORTH_PORT = 'b00001,
    //SOUTH_PORT = 'b00010,
    //WEST_PORT  = 'b00100,
    //EAST_PORT  = 'b01000,
    //LOCAL_PORT = 'b10000
  //} router_ports_t;

  typedef enum logic [2:0] {
    NORTH_PORT,
    SOUTH_PORT,
    WEST_PORT,
    EAST_PORT,
    LOCAL_PORT
  } routes_t;

  typedef struct packed {
    logic north_req;
    logic south_req;
    logic west_req;
    logic east_req;
    logic local_req;
  } s_router_ports_t;

  typedef struct packed {
    flit_type_t               type_f;
    logic [X_WIDTH_FLIT-1:0]  x_dest;
    logic [Y_WIDTH_FLIT-1:0]  y_dest;
    logic [PKT_SZ_WIDTH-1:0]  pkt_size;
    logic [17:0]              fdata;
  } s_flit_head_data_t;

  // Flit handshake interface
  typedef struct packed {
    logic [FLIT_WIDTH-1:0]          fdata;
    logic [$clog2(N_VIRT_CHN)-1:0]  vc_id;
    logic                           valid;
  } s_flit_req_t;

  typedef struct packed {
    logic                   ready;
  } s_flit_resp_t;

`endif