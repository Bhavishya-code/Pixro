import React, { Children } from 'react'

type Props = {
    children : React.ReactNode
}

const Layouts = ({children}: Props) => {
  return (
    <div className="w-full min-h-screen flex justify-center items-center">
        {children}
    </div>
  )
}

export default Layouts