import 'package:flutter/material.dart';

class CommonInfoWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const CommonInfoWidget({
    super.key,
    required this.title,
    required this.onPrevious,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    double screenHorizontalPadding = 20;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      height: double.infinity,
      width: MediaQuery.of(context).size.width - screenHorizontalPadding * 2,
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title),
              const Spacer(),
              InkWell(
                onTap: onSkip,
                child: const Icon(Icons.close, color: Colors.black,)
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: onSkip,
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text('Skip', style: TextStyle(color: Colors.white),)
                        ),
                      ),
                    ),

                    Expanded(child: Container())
                  ],
                ),
              ),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: onPrevious,
                      child: Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.indigo,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_back, color: Colors.white,)
                      ),
                    ),
                
                    const SizedBox(width: 10),
                    
                    InkWell(
                      onTap: onNext,
                      child: Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.indigo,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_forward, color: Colors.white,)
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
