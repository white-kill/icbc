import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInputWidget extends StatefulWidget {
  const SearchInputWidget({super.key});

  @override
  _SearchInputWidgetState createState() => _SearchInputWidgetState();
}

class _SearchInputWidgetState extends State<SearchInputWidget> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _search(String query) {
    if (query.isEmpty) {
      return;
    }
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.w,
      margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
      padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 2.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        color: const Color(0xFFF2F2F2),
      ),
      child: TextField(
        cursorColor: const Color(0xAA263E50),
        controller: _searchController,
        style: TextStyle(
          color: const Color(0xAA263E50),
          fontSize: 15.w,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 1.w),
          hintStyle: TextStyle(
            color: const Color(0xFFBBBBBB),
            fontSize: 15.w,
          ),
          hintText: '输入搜索关键词',
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: const Color(0xFFAAAAAA),
          suffixIconColor: const Color(0xFFAAAAAA),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        onChanged: _search,
        onSubmitted: _search,
      ),
    );
  }
}
