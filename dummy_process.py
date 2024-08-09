import time
import random


if __name__ == "__main__":

    counter = 0
    jackpot = random.randint(5, 10)
    factor = int(time.perf_counter()) % 10
    print(f"Factor: {factor}")

    while True:
        print("|", " "*(counter % 10), "o", " "*(10 - (counter % 10)), "|")
        time.sleep(0.1)
        counter += 1
        if counter == factor:
            raise ValueError("Program failed to continue its execution.")
        if counter == jackpot:
            break
    
    print("Jackpot!")
