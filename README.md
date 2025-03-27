# 🎮 FPGA Pong Game

A classic Pong game implemented in Verilog for FPGA, featuring player controls, ball physics, and VGA rendering.

## 📋 Overview
This project implements Pong in Verilog for FPGA synthesis, including:
- Player paddle control (left/right movement)
- Ball physics (collision, bounce angles)
- VGA-compatible output for rendering
- Auxiliary graphics module (`square.v`) for testing

Designed for learning HDL/FPGA development with Altera/Intel Quartus II.

## ⚙️ Features
✅ **Paddle Control**:
   - Move left/right via `left`/`right` inputs
   - Reset game with `reset`

✅ **Ball Mechanics**:
   - Collision detection with paddle and screen edges
   - State machines (`colisao`, `cont_aux`) for trajectory control

✅ **Graphics Rendering**:
   - Outputs `barra` (paddle) and `bola` (ball) signals for VGA
   - Optional `square.v` module for additional shapes

✅ **Clock Divider**:
   - Generates a slower `innerClk` for game speed control

## 🛠️ Setup & Usage
### 1. Synthesis (Quartus II)
- Open project in Quartus II 9.0+
- Program FPGA

### 2. Simulation (Optional)
- Use ModelSim to verify behavior pre-synthesis
