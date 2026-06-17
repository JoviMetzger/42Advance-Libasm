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
```asm
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
```asm
global _start            	  ;must be declared for linker (ld)

section	.data
  msg db "Hello World!", 0    ;string to be printed
  len equ $ - msg             ;length of the string

section	.text

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

### 🎱 File Structure
There is **no required order** or file structure. <br>
However, a common convention is to place declarations first, followed by data sections, and finally the code section.
**Following a consistent structure makes assembly files easier to read and maintain.**


**Common File structure:**

| Item | Meaning |
| ---- | --- |
| &ensp; <br>1️⃣ `global` <br> &ensp;| **exports** a symbol *(function, variable, struct, etc)* so it can be referenced from other object files. |
| &ensp; <br> 2️⃣ `extern` <br> &ensp;| **imports** a symbol that is defined in another object file or library. |
| &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp; <br>3️⃣ `section .data` <br> &ensp;| contains **initialized variables**.<br>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp; • Strings <br> &ensp;&ensp;&ensp;&ensp;&ensp;&ensp; • Numbers with known initial values <br>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp; • Arrays with predefined contents |
| &ensp; <br> 4️⃣ `section .bss` <br> &ensp; | contains **uninitialized variables**. <br>*(OS initializes .bss* **memory to zero***)* <br>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp; • Buffers<br>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp; • Large arrays <br>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp; • Variables whose initial value doesn't matter  |
| &ensp; <br> 5️⃣ `section .text` <br> &ensp; | Contains **machine instructions** ***(code)***. <br>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp; • Stores program instructions. |
| &ensp; <br> 6️⃣ **code section** <br> &ensp;| code and function definitions. |

<details>
  <summary>🔻&nbsp;&nbsp;<strong> Example :</strong>&nbsp;&nbsp; 🔻</summary>
  <br>
  <ul>

***NOTE:*** *this example is purely for the structure*
```asm
global start

extern ft_strlen
extern malloc

section	.data
   src db "Hello world!", 0
   len equ $ - src - 1

section .bss
   buffer resb 100

section .text

start:
    mov rdi, src
    call ft_strlen
    ret
```

---

</ul>
</details>


<br> <br>

### 🎱 Code Structure

<!--
```
_start:           |   Entry Point
    mov rax, 1    |
    syscall       |
```
```
   eyryy
   mov rax, 1
```

64-bit syscall convention:

| Purpose        | Register |
| -------------- | -------- |
| syscall number | `rax`    |
| arg 1          | `rdi`    |
| arg 2          | `rsi`    |
| arg 3          | `rdx`    |
| arg 4          | `r10`    |
| arg 5          | `r8`     |
| arg 6          | `r9`     |
NpOTE return in rax

| Syscall | Number |
| ------- | ------ |
| `read`  | 0      |
| `write` | 1      |
| `open`  | 2      |
| `close` | 3      |
| `exit`  | 60     |

30most used mnemics
---
-->

<br>

<details>
  <summary><strong> 🎱 &nbsp;&nbsp; Comments</strong></summary>
  <ul>

## 🎱 Comments

Assembly language comments begin with a semicolon `;`.
```asm
mov rax, 42      ; This is a comment
```


---

<br>
</ul>
</details>

<details>
  <summary><strong> 🎱 &nbsp;&nbsp;.data &nbsp; Info</strong></summary>
  <br>
  <ul>



## 🎱 .data Info

### Different Types of Strings

| | Null-Terminated String | String with Newline | Raw Byte Sequence |
| ---- | ---- | ---- | ---- |
| &ensp; <br>**Example** <br>&ensp; | `src db "Hello world!", 0` | `src db "Hello world!", 10, 0` | `src db "Hello world!"` |
| &ensp; <br>**Meaning**  <br>&ensp;| `0` represents a null terminator (`'\0'`), <br> marking the end of the string. | `10` is the ASCII newline character (`'\n'`). <br>The string ends with a newline followed by a null terminator. | A sequence of bytes with no terminator. |
| &ensp; <br>**Stored Bytes** <br>&ensp; | `H e l l o   w o r l d ! [\0]` | `H e l l o   w o r l d ! [\n] [\0]` | `H e l l o   w o r l d !` |


- A **raw byte sequence** is perfectly valid when using system calls such as `write`, because `write` requires an explicit length.

- Functions such as `strlen()` and `printf("%s")`, expect a **null-terminated string**. Without a null terminator, they will continue reading memory until a `'\0'` byte is encountered, resulting in undefined behavior.

<br>

### String Length

```
src db "Hello world!", 0
len equ $ - src                 | 13 (includes the null terminator)
len equ $ - src - 1             | 12 (excludes the null terminator)
```

> **Note:** `$ - src` calculates the total number of bytes between the current location (`$`) and the label (`src`). It includes every byte defined after `src`, including a null terminator if one exists.

<br>

### Good to Know

| | Output | Reason |
| --- | --- | --- |
| `write`  | Prints immediately when the syscall is executed. | • Uses an unbuffered system call.<br>• Writes directly to the file descriptor *(stdout, file, pipe, etc.)*.<br>• Requires an explicit byte count. |
| `printf` | May not print immediately, even if called before other statements. | • Uses buffered I/O.<br>• When writing to a terminal, output is typically **line-buffered** *(flushed on `\n`)*. <br> • When writing to a file or pipe, output is often **fully buffered**.<br>• Output appears when the buffer is flushed, becomes full, or the program exits. |


#### Solution ⭕ Option 1: Call `fflush`
```asm
section .data
    intFormat db "%zu", 0

mov rdi, intFormat      ; format string
mov eax, 0              ; no vector arguments
call printf

xor edi, edi            ; NULL -> flush all output streams
call fflush
```


#### Solution ⭕ Option 2: Add a Newline
```asm
section .data
    intFormat db "%zu", 10, 0

mov rdi, intFormat      ; format string
mov eax, 0              ; no vector arguments
call printf
```

> **Note:** When stdout is connected to a terminal, adding a newline usually causes the line-buffered stream to flush automatically. If stdout is redirected to a file or pipe, the output may still remain buffered.

<br>

---

<br>
</ul>
</details>

<details>
  <summary><strong> 🎱 &nbsp;&nbsp; CH</strong></summary>
  <ul>

## 🎱 CH


kkkkkk

<br> <br>
</ul>
</details>

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




<!-- 
NOT DONE:


## Assembly Program Structure

### 🎱 Code Structure

```
_start:           |   Entry Point
    mov rax, 1    |
    syscall       |
```
```
   eyryy
   mov rax, 1
```

64-bit syscall convention:

| Purpose        | Register |
| -------------- | -------- |
| syscall number | `rax`    |
| arg 1          | `rdi`    |
| arg 2          | `rsi`    |
| arg 3          | `rdx`    |
| arg 4          | `r10`    |
| arg 5          | `r8`     |
| arg 6          | `r9`     |
NpOTE return in rax

| Syscall | Number |
| ------- | ------ |
| `read`  | 0      |
| `write` | 1      |
| `open`  | 2      |
| `close` | 3      |
| `exit`  | 60     |

30most used mnemics
---


<details>
  <summary><strong> 🎱 &nbsp;&nbsp; CH</strong></summary>
  <ul>

## 🎱 CH




---

<br>
</ul>
</details>

<br><br>



Different meanings:

write(1, msg, len)
```
mov rax, 1 
mov rdi, 1 
mov rsi, msg 
mov rdx, len 
syscall
```

Yes. You can call the exit only once at the end of main after all your test calls.

For a test harness, the usual pattern is:
```
; test 1
; test 2
; test 3

mov eax, 0
leave
ret
```

That is often better than using the Linux exit syscall in the middle of the file, because main is normally returned from like a regular C function. If you do want to use the syscall version, keep it only once at the very end:
```
mov rdi, 0
mov rax, 60
syscall
```
exit(0)
```
mov rax, 60
mov rdi, 0
syscall
```

read(0, buffer, 100)
```
mov rax, 0
mov rdi, 0
mov rsi, buffer
mov rdx, 100
syscall
```

open(filename, 0)
```
mov rax, 2
mov rdi, filename
mov rsi, 0
syscall
```


---

For exit:

- rax = 60 selects exit
- rdi = 0 means “exit successfully”

So this is correct:

mov rdi, 0
mov rax, 60
syscall

```
mov rax, 60
xor edi, edi
syscall
```
mov rax, 60 = exit(0);
what is xor edi, edi

`xor edi, edi` sets `edi` to zero.

It works because XORing a register with itself always produces `0`:

```asm
xor edi, edi
```

For `syscall` exit, that means:

- `rax = 60` selects the `exit` syscall
- `rdi = 0` is the exit status
- `syscall` terminates the program successfully

So this is just a compact way to write `mov rdi, 0`, and in 64-bit mode writing to `edi` also clears the upper 32 bits of `rdi`.

so ;xor edi, edi and ;mov rdi, 0	 ar ethe same?

Yes, for this use they are effectively the same.

`mov rdi, 0` explicitly sets `rdi` to zero.

`xor edi, edi` also sets `rdi` to zero, because writing to `edi` clears the full 64-bit `rdi` register in x86-64.

The difference is that `xor edi, edi` is a common shorter/faster way to zero the register.


Both end with `rax = 60` and `rdi = 0` right before `syscall`, so the program exits with status 0.

The only practical difference is style. People often put `mov rax, 60` first because it reads more like “select syscall, set args, invoke syscall,” but the CPU does not care as long as the values are correct at the moment of `syscall`.

---



The crash source is now narrow: `main` is ending with `leave`/`ret` even though the frame-pointer prologue is commented out, so it returns with an invalid stack frame. I’m restoring the prologue and keeping the `printf` call ABI-safe in the same small edit.


`push rbp` / `mov rbp, rsp` is the standard prologue for any function when you want a normal stack frame. It is used for:

- keeping a stable frame pointer
- making local variables and saved registers easier to access
- making `leave` / `ret` work correctly
- helping stack alignment before function calls like `printf`

In your `main`, it matters because you call `ft_strlen` and `printf`, and you return with `leave` / `ret`.

If you were writing a tiny assembly function that just does a syscall and never returns with `ret`, you could sometimes skip it. But for a normal function like `main`, it is the right pattern.


For a test harness, the usual pattern is:

```asm
; test 1
; test 2
; test 3

mov eax, 0
leave
ret
```

That is often better than using the Linux `exit` syscall in the middle of the file, because `main` is normally returned from like a regular C function. If you do want to use the syscall version, keep it only once at the very end:

```asm
mov rdi, 0
mov rax, 60
syscall
```

So yes, test all the functions you want first, then exit once at the end.

what is this used for then?
mov eax, 0
	leave
	ret

That is the normal way to end a function in assembly.

`mov eax, 0` sets the return value of `main` to 0, which means success.

`leave` undoes the stack frame created by:

- `push rbp`
- `mov rbp, rsp`

- restore the stack
- return 0 from `main`
- finish the function cleanly

In your current file, this is the proper ending if you are returning from `main` like a normal C function.

Yes. In `main`, it is essentially the assembly equivalent of `return 0;`.

```asm
mov eax, 0
leave
ret
```

means:

- set the function return value to 0
- restore the stack frame
- return to the caller

So for a normal C-style function, that is the same idea as:

```c
return 0;
```

The difference is that in assembly you also have to clean up the stack frame yourself with `leave` before `ret`.


xor eax, eax		
call printf

Yes. For `printf`, `xor eax, eax` is important.

On x86-64 System V ABI, variadic functions like `printf` need `al` to contain the number of vector registers used for floating-point arguments. If you are not passing any floating-point arguments, that value must be 0.

So this is correct:

```asm
xor eax, eax
call printf
```

`mov eax, 0` would also work. `xor eax, eax` is just the shorter/common way to zero `eax`.

Without it, `printf` may mis-handle the call because it thinks you passed floating-point arguments when you did not.

so mov eax, 0 and xor eax, eax are just saying to printf that no floating-point arguments was passed
Yes, for `printf` and other variadic functions on x86-64 System V, setting `eax` to 0 tells the call ABI that no floating-point/vector arguments were passed in XMM registers.

More precisely:

- `al` holds the number of vector registers used for variadic arguments
- `xor eax, eax` clears that to 0
- `mov eax, 0` does the same thing

So your understanding is basically right, but it is an ABI rule for variadic calls, not `printf` itself.

if floating-point/vector arguments were passed would it then be mov eax, 1
Not exactly. The value in `al` should match the **count** of XMM registers you used for floating-point arguments.

So:

- No floating-point args: `mov eax, 0`
- 1 floating-point arg (in XMM0): `mov eax, 1`
- 2 floating-point args (in XMM0, XMM1): `mov eax, 2`
- etc.

For example, if you were calling `printf` with a double:

```asm
movsd xmm0, [some_double]  ; pass double in XMM0
mov rdi, format_string
mov eax, 1                 ; 1 XMM register used
call printf
```

You set `al` to the count of XMM registers you filled with arguments.

---






---

The movsb (Move String Byte) instruction in x86 assembly copies a single byte from the source memory location to the destination

In assembly language, MOVSB (MOVe String Byte) is a specialized instruction used to copy a 1-byte value from one memory location to another. It is frequently used with a repeat prefix (REP)


movsb will only copy a single byte. You must use the rep prefix to do multiple bytes.

What is DF?

DF = Direction Flag.

String instructions like:

movsb

can move:

forward
backward

depending on DF.

cld

means:

DF = 0

which makes pointers increase:

rsi++
rdi++

after each byte copy.

What does times 32 db 0 mean?

This is NASM syntax:

dest times 32 db 0

means:

Create 32 bytes
Initialize every byte to 0


What does lea mean?

lea = Load Effective Address

It computes an address and stores that address in a register.

lea rdi, [rel strFormat]

means:

rdi = address of strFormat

So:

rdi = 0x1000

not:

rdi = '%'

and not:

rdi = "%s\n"

but the address where the string begins.

---


rsp is the stack pointer register in x86-64.

So when you see:

sub rsp, 8

or

add rsp, 8

it means you are moving the stack up or down by 8 bytes.

🧠 1. What is rsp?
RSP = Register Stack Pointer

It always points to the top of the stack (current stack position in memory).

Think:

stack = memory area used for function calls, local variables
rsp = “where the stack currently ends”
🧠 2. What does sub rsp, 8 mean?
sub rsp, 8

👉 Move stack pointer down by 8 bytes

That means:

you just “reserved space” on the stack

Visually:

Before:
rsp → [old top]

After sub rsp, 8:
rsp → [new space allocated]
🧠 3. Why do we do this before printf?

On Linux x86-64 (System V ABI):

👉 The stack must be 16-byte aligned before calling functions

So sometimes you adjust it like:

sub rsp, 8
call printf
add rsp, 8
🧠 4. What does add rsp, 8 do?
add rsp, 8

👉 Undo the change

So you:

allocate stack space before call
restore stack after call
🧠 5. Why 8 specifically?

Because:

registers are 64-bit = 8 bytes
stack alignment rules often require adjusting by 8 to fix 16-byte alignment
🧠 6. Simple analogy

Think of stack like a pile of plates:

rsp = pointer to top plate
sub rsp, 8 = “move pointer down → reserve space”
add rsp, 8 = “move pointer back up → cleanup”
⚠️ 7. What happens if you don’t align rsp?

Bad things like:

crashes in printf
random memory corruption
broken SIMD instructions inside libc

Even if your code “seems fine”




mov eax, 0			; NO floating-point/vector arguments were passed (for ABI rules) -> xor eax, eax: required for variadic functions



# Core Topics Checklist

## Registers

- [ ] General-purpose registers
- [ ] Register aliases (`rax`, `eax`, `ax`, `al`)
- [ ] Calling convention registers
- [ ] Stack pointer (`rsp`)
- [ ] Base pointer (`rbp`)

## Memory

- [ ] Stack memory
- [ ] Heap memory

## Instructions

- [ ] `mov`
- [ ] `lea`
- [ ] `push`
- [ ] `pop`
- [ ] `call`
- [ ] `ret`
- [ ] `cmp`
- [ ] `test`
- [ ] Conditional jumps (`je`, `jne`, `jg`, `jl`)
- [ ] Arithmetic (`add`, `sub`, `imul`, `idiv`)



---
---



- Cheat Sheets & References (x86-64 / NASM)
  - [x64 NASM Cheat Sheet](https://gist.github.com/justinian/385c70347db8aca7ba93e87db90fc9a6)
  - [x86-64 Reference Sheet (PDF)](https://people.kth.se/~dbro/x86-64-ref-sheet.pdf)
  - [x86-64 Quick Reference](https://www.cs.uaf.edu/2017/fall/cs301/reference/x86_64.html)
  - [Assembly Mnemonics List](https://hackaday.io/project/188193-assembly-language-for-ecm-16ttl-homebrew-cpu/log/213335-mnemonics-list)




-->
