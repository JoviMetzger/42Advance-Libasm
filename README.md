# 🛠️🔩 Assembly 🛠️🔩

<br><br>

## Table of Contents
  - [What is Assembly?](#what-is-assembly?)
  - [The Assembly Ecosystem](#the-assembly-ecosystem)
      - [Processor architecture *(x86, ARM, RISC-V)*](#processorArchitecture)
      - [Bitness *(16-bit, 32-bit, 64-bit)*](#bitness)
      - [Assembler Software *(NASM, MASM, GAS)*](#assemblerSoftware)
  - [Intel Syntax vs. AT&T Syntax](#intel-syntax-vs.-AT&T-syntax)
  - [ABI Rules](#ABI-rules)
  - [Getting Started](#getting-started)
    - [Installation and Setup](#installationSetup)
    - [Compiling Assembly](#compilingAssembly)
    - [Assembly Program Structure](#assemblyStructure)
    - [Cheat Sheet](#cheatSheet)
  - [Resources](#resources)

<br>

---


## ⚙️What is Assembly?
Every computer has a **processor (CPU)** that performs calculations, makes decisions, and controls how the computer works. <br>

A processor can only understand instructions written in **machine language**, <br>which consists of binary numbers (**0s and 1s**). <br>
***For Example:*** *`10110000 01100001`* <br>

Computers can read machine language directly, but it is extremely difficult for humans to write, read, and debug. <br> Because of this, **assembly language** was created.<br>

Assembly provides a human readable representation of machine instructions, allowing programmers to communicate directly with the processor using short, readable commands called **mnemonics**. <br>
***For Example:*** 
```
mov rdi, 5
add rdi, 3 
```

<br>

Even though modern programming languages are much easier to use, assembly language is still important because it provides: <br>
  * **Very fast and efficient programs**
  * **Direct control over hardware**
  * **Low memory usage**
  * **Access to processor-specific features**

<br>

---

## ⚙️The Assembly Ecosystem

In assembly programming, there are three important concepts:

<ul><details>
  <summary id="processorArchitecture">&nbsp;&nbsp;&nbsp;<strong>Processor architecture</strong> <i>(x86, ARM, RISC-V)</i> </summary>
  <br>

## Processor architecture
Each processor architecture *(such as x86, ARM, or RISC-V)* has its own **instruction set architecture (ISA)**.<br>

A processor architecture defines the instruction set, **registers, memory-access rules**, and other features that software uses to communicate with the CPU. Because different architectures use different instruction sets, assembly language written for one architecture *(such as x86-64)* generally cannot run directly on another architecture *(such as ARM or RISC-V)*. <br> <br>

**Processors Architecture Type:**
```
 •  x86-64  – Used in most desktop and laptop computers
 •  ARM     – Used in smartphones, tablets, and many embedded systems
 •  RISC-V  – An open-source processor architecture that allows anyone to design compatible processors without licensing fees
```
<br>

Each architecture has its own assembly language. <br>
**For example:** <br>
```
x86 assembly   |   ARM assembly
-------------- | ---------------
mov eax, 5     |   MOV R0, #5
add eax, 3     |   ADD R0, R0, #3

```
**Both programs do the same thing:** `5 + 3 = 8`<br>

The instructions look different because the processors are different. <br>
Assembly code written for one processor architecture will usually not work on another without modification.

---

<br>

</details>

<details>
  <summary id="bitness">&nbsp;&nbsp;&nbsp;<strong>Bitness</strong> <i>(16-bit, 32-bit, 64-bit)</i></summary>
  <br>

## Bitness

Bitness describes the width of a processor's general-purpose registers and the address size supported by an architecture. It influences how much data can be handled efficiently and how memory addressing works, but it does not define the instruction set architecture. Different architectures can have the same bitness while using completely different instruction sets.

**For example:** <br>
x86-64 has instructions that 32-bit x86 doesn't. <br>
But two different 64-bit architectures *(x86-64 and ARM64)* have completely different instruction sets despite having the same bitness.


**The "bitness" mainly determines:** <br>
&emsp; •&nbsp; Register size<br>
&emsp; •&nbsp; Memory address size<br>
&emsp; •&nbsp; The size of data the CPU can process in a single operation<br><br><br>

➡️ **The different bit versions:**
```
  • 16-bit
  • 32-bit
  • 64-bit
```
<br>

➡️ **The different processors versions:**
```
The evolution of the x86 family:

x86 family
 ├─ 16-bit (8086, 80286)
 ├─ 32-bit (80386, 80486, Pentium)
 └─ 64-bit (x86-64 / AMD64)

----------------------------------

The evolution of the ARM family:

ARM family
 ├─ 32-bit (ARM / AArch32)
 └─ 64-bit (ARM64 / AArch64)
```
❗**NOTE:**❗ <br>
The names inside the parentheses are examples of processors or architecture versions belonging to that family and bitness. <br>  

---

<br>


</details>

<details>
  <summary id="assemblerSoftware">&nbsp;&nbsp;&nbsp;<strong>Assembler software</strong> <i>(NASM, MASM, GAS)</i></summary>
  <br>

## Assembler software
Before a computer can run an assembly program, it must be translated into machine language by a program called an assembler.
An assembler is simply a program that translates assembly language into machine code.<br>

Assemblers Software all target the same processor family but use slightly different syntax and features. <br>
Think of them as different translators for the same language. <br>

**Assemblers for the x86 architecture:** <br>
&emsp; •&nbsp; Microsoft Macro Assembler **(MASM)** <br>
&emsp; •&nbsp; Borland Turbo Assembler **(TASM)** <br>
&emsp; •&nbsp; GNU Assembler **(GAS)** <br>
&emsp; •&nbsp; Netwide Assembler **(NASM)** <br><br>

**Assemblers for the ARM architecture:** <br>
&emsp; •&nbsp; GNU Assembler **(GAS)** <br>
&emsp; •&nbsp; ARMASM **(Arm Compiler Assembler)** <br>
&emsp; •&nbsp; LLVM Integrated Assembler **(Clang)** <br><br>

**Assemblers for the RISC-V architecture:** <br>
&emsp; •&nbsp; GNU Assembler **(GAS)** <br>
&emsp; •&nbsp; LLVM Integrated Assembler **(Clang)** <br>
&emsp; •&nbsp; RISC-V GNU Toolchain Assembler <br><br>

### ❓ What assembler should I use for x86-64❓
**For a beginner:** <br>
&emsp; •&nbsp; Processor: x86-64 <br>
&emsp; •&nbsp; Assembler: NASM <br>
&emsp; •&nbsp; Operating System: Windows or Linux <br>

**NASM assembler because it is:** <br>
&emsp; •&nbsp; Free and open source <br>
&emsp; •&nbsp; Well documented <br>
&emsp; •&nbsp; Widely used in tutorials and educational material <br>
&emsp; •&nbsp; Available on Linux, macOS and Windows <br>
&emsp; •&nbsp; Easy for beginners to learn <br>

---

<br>

</details></ul>

#### In Summary:
**The Processor architecture** determines which **instructions** the CPU understands. <br>
**Bitness** determines the **size** of registers and **memory addresses** the CPU can work with. <br>
**Assembler software translates** assembly language **into machine code** for a specific architecture. <br>

<br>

---

## ⚙️Intel Syntax vs. AT&T Syntax
Assembly language can generally be written using two syntax styles: <br><br>
1️⃣ **Intel syntax** <br>
2️⃣ **AT&T syntax** <br><br>
The underlying instructions are the same, but the notation is different.


|           | Intel Syntax | AT&T Syntax |
| --------- | ------------ | ----------- |
| Example 1 | `mov rax, 5` | `mov $5, %rax` |
| Example 2 | `mov rax, rbx` | `mov %rbx, %rax` |
| Meaning *(Example 2)* | Move the contents of `rbx` into `rax`<br>`rax = rbx`                  | Move the contents of `rbx` into `rax`<br>`rax = rbx` |
| Operand Order         | `mov destination, source`                                             | `mov source, destination`                            |
| Special Symbols       | None | `%` = register syntax &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&nbsp;**→** `%rax`<br>`$` = constant *(immediate value)* **→** `$5` |
| Originated From  | Intel's official documentation | Early UNIX systems |
| Commonly Used By | • NASM<br>• MASM<br>• Intel manuals<br>• Windows assembly development | • GAS<br>• GCC output<br>• Older UNIX tools <br> &ensp;|

---

<br>

## ⚙️ABI Rules
An **Application Binary Interface (ABI)** is a low-level set of rules that allows compiled machine code communicates correctly with: <br>
&emsp; •&nbsp; the operating system <br>
&emsp; •&nbsp; libraries <br>
&emsp; •&nbsp; other compiled programs <br>
&emsp; •&nbsp; hardware interfaces <br> <br>

•&nbsp; **The compiler cares heavily about ABI rules.** <br>
•&nbsp; **Assembly programmers must follow them manually.** <br>
•&nbsp; **Without a common ABI, separately compiled code could not reliably work together.**

**The ABI defines things such as:** <br>
&emsp; •&nbsp; Which registers hold function arguments <br>
&emsp; •&nbsp; Which register holds the return value <br>
&emsp; •&nbsp; How the stack is organized <br>
&emsp; •&nbsp; Which registers a function must preserve <br>
&emsp; •&nbsp; How system calls are made <br>

<br>

❗ **Important practical rule:** ❗ <br>
&emsp; 🔺&nbsp; argument in rdi <br>
&emsp; 🔺&nbsp; return in rax <br>
&emsp; 🔺&nbsp; stack aligned to 16 bytes <br>

<br>

**Modern Linux x86-64 Guidelines** <br>
**Use:** <br>
&emsp; •&nbsp; rax, rdi, rsi, rdx, rcx, r8, r9 <br>
&emsp; •&nbsp; syscall <br>
&emsp; •&nbsp; x86-64 syscall numbers <br>
&emsp; •&nbsp; System V AMD64 ABI <br>

**Avoid:** <br>
&emsp; •&nbsp; int 0x80 <br>
&emsp; •&nbsp; 32-bit syscall tables <br>
&emsp; •&nbsp; eax, ebx, ecx, edx syscall conventions <br>

unless intentionally writing 32-bit code.

---

## ⚙️Getting Started

I recommend reading through [A Faker's Guide to Assembly](https://www.timdbg.com/posts/fakers-guide-to-assembly/). It introduces the **30 most common instruction types**, which helps you understand what instructions exist and serves as a useful reference once you start writing assembly yourself.

<br>


<ul><details>
  <summary id="installationSetup">&nbsp;&nbsp;&nbsp;<strong>Installation and Setup</strong></summary>
  <br>


## Installation and Setup
**IF you work from home and need to install NASM** <br>

#### 1) Check if NASM is installed already *("Development Tools" installs it automataclly if you install Linux)*
- Open terminal **->** `whereis nasm`
- If it is already installed, then a line like, `nasm: /usr/bin/nasm` appears. <br> Otherwise, you need to install NASM.

#### 2) Install NASM:
- Check The netwide assembler (NASM) website for the latest version
- Download your OS *(Linux, Window, macOS)* source archive `nasm-X.XX.ta.gz`
- Unpack the archive *(Open the .zip or .ta file)*
- `cd` to into the nasm file and type `./configure`.
- Type `make` to build the nasm and ndisasm binaries.
- Type `make install` to install nasm and ndisasm **->** This will create `/usr/local/bin` 

---

<br>

</details>

<details>
  <summary id="compilingAssembly">&nbsp;&nbsp;&nbsp;<strong>Compiling Assembly</strong></summary>
  <br>

## Compiling Assembly
**Compiling an Assembly Program in NASM**
```
 •  .asm :  The most common extension used across x86 and embedded systems.
 •  .s   :  Used primarily by GNU tools *(like GCC)* for standard assembly source files.
 •  .S   :  A GNU extension, but indicates to the compiler that the file must first be preprocessed by the C preprocessor before being assembled.
```

#### 1) Create File
- Create `test.s` file
- **NOTE:** this example is written in 64-bit assembly
- **NOTE:** `;` is a comment in Assembly language
- **NOTE:** If you don't understand what is happening below, **that is okay!** This is only about compiling. <br>But in short this means: **`write(1, msg, len)`**
```
section	.text
	global _start             ;must be declared for linker (ld)

section	.data
  msg db "Hello World!", 0    ;string to be printed
  len equ $ - msg             ;length of the string

_start:	                      ;tells linker entry point
   mov  rax, 1                ;system call number (sys_write)
   mov	rdi, 1                ;file descriptor (stdout)
   mov	rsi, msg              ;message to write
   mov	rdx, len              ;message length
   syscall                    ;call kernel
	
   mov	rax, 60               ;system call number (sys_exit)
   mov  rdi, 0                ;system call number (sys_read)
   syscall                    ;call kernel

```

#### 2) Compiled and Executed
&emsp; •&nbsp; **1.** Assemble the program, `nasm -f elf64 test.s` <br>
&emsp; •&nbsp; **NOTE:**&nbsp;&nbsp;&nbsp;  for linux:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `elf64` <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for windows: `win64`<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for macOS:&nbsp;&nbsp;&nbsp; `macho64` <br>
&emsp; •&nbsp; **2.** To link the object file and create an executable file `ld test.o -o TestMe` **->** *executable name: `TestMe`* <br>
&emsp; •&nbsp; **NOTE:**&nbsp;&nbsp;&nbsp;  for Linux: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`ld` <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for Windows: `gcc`<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for macOS: &nbsp;&nbsp;&nbsp;&nbsp;`clang`<br>
&emsp; •&nbsp; **3.** Execute the program: `./TestMe` <br>
&emsp; •&nbsp; **4.** **OUTPUT** should be `Hello World!` <br>
<ul>

**Example:** *(Linux)* 
```
nasm -f elf64 test.s
ld test.o -o TestMe
./TestMe
```

<br>


| OS      | NASM format | Object extension | Linker | Example |
| ------- | ----------- | ---------------- | ------ | ------- |
| Linux   | `elf64`     | `.o`             | `ld`   | nasm -f elf64 hello.asm -o hello.o <br> ld hello.o -o hello |
| Windows | `win64`     | `.obj`           | `gcc`  | nasm -f win64 hello.asm -o hello.obj <br>gcc hello.obj -o hello.exe |
| macOS   | `macho64`   | `.o`             | `clang` | nasm -f macho64 hello.asm -o hello.o <br>clang hello.o -o hello |

</ul>

#### 3) GNU Debugger (optinal)

After you have assembled and linked your assembly code into an executable named `TestMe`, you can load and debug it using gdb **(GNU Debugger)**. <br><br>
**Here's how you can do it:** &emsp; run `gdb ./TestMe -tui` <br> <br>
You're invoking **GDB (GNU Debugger)** with the **Text User Interface (TUI)** mode enabled. <br>
This mode provides a terminal-based graphical interface that splits the screen into **two parts.** <br>
* **Part 1:** The top part shows your source code *(test.s)* <br>
* **Part 2:** The bottom part of the screen displays the usual command-line interface of GDB, where you can type commands, set breakpoints, examine memory, view registers, and interact with the debugger.

<br><br>

The Medium article, [Understanding 16-bit, 32-bit, and 64-bit Operand Behavior](https://medium.com/@rivian96/understanding-16-bit-32-bit-and-64-bit-operand-behavior-in-assembly-70a6e3addf80), focuses more on register sizes and operand behavior. It also includes an introduction to using the **GNU Debugger (GDB)**, which may be useful if you're interested in debugging assembly programs. 

<br>


---

<br>

</details>

<details>
  <summary id="assemblyStructure">&nbsp;&nbsp;&nbsp;<strong>Assembly Program Structure</strong></summary>
  <br>

HHH

---

<br>

</details>

<details>
  <summary id="cheatSheet">&nbsp;&nbsp;&nbsp;<strong>Cheat Sheet</strong></summary>
  <br>

HHH

---

<br>

</details></ul>

---

## ⚙️Resources

- Fundamentals (Basic Info)
  - [A Faker's Guide to Assembly](https://www.timdbg.com/posts/fakers-guide-to-assembly/)
  - [Understanding 16-bit, 32-bit, and 64-bit Operand Behavior](https://medium.com/@rivian96/understanding-16-bit-32-bit-and-64-bit-operand-behavior-in-assembly-70a6e3addf80)

<br>

- Cheat Sheets & References (x86-64 / NASM)
  - [x64 NASM Cheat Sheet](https://gist.github.com/justinian/385c70347db8aca7ba93e87db90fc9a6)
  - [x86-64 Reference Sheet (PDF)](https://people.kth.se/~dbro/x86-64-ref-sheet.pdf)
  - [x86-64 Quick Reference](https://www.cs.uaf.edu/2017/fall/cs301/reference/x86_64.html)
  - [Assembly Mnemonics List](https://hackaday.io/project/188193-assembly-language-for-ecm-16ttl-homebrew-cpu/log/213335-mnemonics-list)

<br>
