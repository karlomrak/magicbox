
import { NextApiRequest, NextApiResponse } from "next";


import { Facade } from "@koksmat/facade"
export default function handler(req:NextApiRequest, res:NextApiResponse) {

  const doc = Facade.getInstance().routeKeys
  
  

    res.status(200).json(doc)
  }